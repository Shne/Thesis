/* 
 * File:   Node.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */ 

#include "Node.h"
#include <iostream>
#include <cmath>
#include <climits>

using namespace std;

Node::Node() {};

Node::Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode,
           Node* &node_pt, bitmap_t* in_bitmap, ulong &in_bitmapOffset,
           vector<ushort> &blockRanks, uint blockSize)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
    
    uint alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
        isLeaf = true;
        return;
    }
    
    bitmapSize = input->size(); //one bit for each character in the input string
    bitmapOffset = in_bitmapOffset;
   
    uint split = (uint)((alphabetSize-1)/2 + alphabetMin);

    uint leftAlphabetMin = alphabetMin; 
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;
    
    vector<uint>* leftString = new vector<uint>();
    vector<uint>* rightString = new vector<uint>();
    
    uint bitmapMisalignment = CHAR_BIT * ((ulong)in_bitmap->begin()._M_p % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
    for(auto it = input->begin(); it != input->end(); it++, in_bitmapOffset++) {
        uint currentChar = *it;
        if(currentChar <= split) {
            (*in_bitmap)[in_bitmapOffset] = false;
            leftString->push_back(currentChar);
        } else {
            (*in_bitmap)[in_bitmapOffset] = true;
            rightString->push_back(currentChar);
            ulong blockAlignedOffset = in_bitmapOffset + bitmapMisalignment;
            blockRanks[blockAlignedOffset/blockSize] += 1;
        }
    }
    input->clear();
    delete input;
    
//    if(rightString->size() == 0 || leftString->size() == 0) {
//        //then kinda ignore us; reset bitmap offset
//        in_bitmapOffset = bitmapOffset;
//        bitmap = nullptr;
//        bitmapSize = 0;
//    }
    
    //construct node, save it at right pointer location. give it incremented node_pt and bitmap_it so they point to free space.
    if(rightString->size() != 0) {
        node_pt++; //increment to free space
        right = new (node_pt) Node(rightString, rightAlphabetMin, rightAlphabetMax,
                this, node_pt, in_bitmap, in_bitmapOffset, blockRanks, blockSize);
    } else {
        rightString->clear();
        delete rightString;
    }
    //same for left. node_pt and bitmap_it should have been incrememented by our right subnode to point to free space now.
    if(leftString->size() != 0) {
        node_pt++;
        left = new (node_pt) Node(leftString, leftAlphabetMin, leftAlphabetMax,
                this, node_pt, in_bitmap, in_bitmapOffset, blockRanks, blockSize);
    } else {
        leftString->clear();
        delete leftString;
    }
}


int Node::rank(int character, unsigned long index, bitmap_t* bitmap, int alphabetMin,
               int alphabetMax, vector<ushort> &blockRanks, uint blockSize){
    if(isLeaf){
//        cout << "Rank Leaf" << endl;
        return index;
    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (int)((alphabetSize-1)/2 + alphabetMin);
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos;
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
        pos = blockBinaryRank(index, bitmap, blockRanks, blockSize);
        rank = right->rank(character, pos, bitmap, rightAlphabetMin, rightAlphabetMax, blockRanks, blockSize);
    }else if(left != nullptr){
        pos = index - blockBinaryRank(index, bitmap, blockRanks, blockSize);
        rank = left->rank(character, pos, bitmap, leftAlphabetMin, leftAlphabetMax, blockRanks, blockSize);
    }
    
    return rank;
}

ulong Node::popcountBinaryRank(ulong startOffset, ulong length, bitmap_t* bitmap) {
    ulong rank = 0;
    ulong initialOffset = 0;
    vector<bool>::reference ref = (*bitmap)[startOffset];
    ulong* wordPtr = ref._M_p;
    uint wordSize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT;
    //PART OF FIRST WORD if unaligned
    if(startOffset % wordSize != 0) {
        //create 111110000 type mask from 000010000 type mask
        ulong firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        ulong maskedFirstWord = (*ref._M_p) & firstMask;
        rank += __builtin_popcountl(maskedFirstWord);
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        wordPtr++; ///pointer was to a word we only partially had bits in
    }

    //FULL WORDS
    uint alignedPos = length - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    ulong fullWords = alignedPos / wordSize; //the amount of full words we should iterate through. 
    for(uint i = 0; i < fullWords; i++) {
        rank += __builtin_popcountl(*wordPtr);
        wordPtr++;
    } //we believe i is incremented even after the condition has failed

    //PART OF LAST WORD (if unaligned)
    ulong word = *wordPtr;
    ulong shift = alignedPos % wordSize; //if word-aligned, shift will be 0, making mask (below) all 0.
    ulong mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    ulong maskedWord = word & mask; //if word-aligned maskedWord will be 0
    rank += __builtin_popcountl(maskedWord);
    return rank;
}

ulong Node::blockBinaryRank(ulong pos, bitmap_t* bitmap, vector<ushort> &blockRanks, uint blockSize) {
//    cout << pos << " " << bitmapSize << " " << flush;
    assert(pos <= bitmapSize);

#ifdef PARTIALBLOCKS

    //FOR SMALL BITMAPS
    if(pos < blockSize) {
        return popcountBinaryRank(bitmapOffset, pos, bitmap);
    }

    ulong rank = 0;
    uint bitmapMisalignment = CHAR_BIT * ((ulong)bitmap->begin()._M_p % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
    uint blockMisalignment = ((bitmapMisalignment + bitmapOffset) % blockSize); //how far inside a block our part of the bitmap starts
    uint lengthToNextBlockalignment = (blockSize - blockMisalignment) % blockSize; //modulo so it's 0 when blockMisalignment is 0

    //FIRST PARTIAL BLOCK
    if((lengthToNextBlockalignment > blockSize / 2) && (blockMisalignment < bitmapOffset)) {
        //do popcount binary rank on smaller part and subtract from precomputed rank
        ulong startOffset = bitmapOffset - blockMisalignment;
        ulong length = blockMisalignment;
        uint blockIndex = (bitmapOffset + bitmapMisalignment - blockMisalignment) / blockSize;
        rank = blockRanks[blockIndex] - popcountBinaryRank(startOffset, length, bitmap);
    } else {
        //do popcount binary rank on smaller part
        ulong startOffset = bitmapOffset;
        ulong length = lengthToNextBlockalignment;
        rank = popcountBinaryRank(startOffset, length, bitmap);
    }

    //FULL BLOCKS
    int fullBlocks = (pos - lengthToNextBlockalignment) / blockSize;
    uint blockIndex = (bitmapOffset + bitmapMisalignment + lengthToNextBlockalignment) / blockSize;
    for(uint i = 0; i < fullBlocks; i++) {
        rank += blockRanks[blockIndex];
        blockIndex++;
    }

    //LAST PARTIAL BLOCK
    ulong lastBlockOffset = bitmapOffset + lengthToNextBlockalignment + fullBlocks*blockSize;
    uint sizeOfLastPartialBlock = (pos - lengthToNextBlockalignment) % blockSize;
    if((sizeOfLastPartialBlock > blockSize / 2) && (lastBlockOffset + blockSize <= bitmap->size())) {
        //do popcount binary rank on smaller part and subtract from precomputed rank
        uint startOffset = lastBlockOffset + sizeOfLastPartialBlock;
        uint length = blockSize - sizeOfLastPartialBlock;
        uint blockIndex = (lastBlockOffset + bitmapMisalignment) / blockSize;
        rank += blockRanks[blockIndex] - popcountBinaryRank(startOffset, length, bitmap);
    } else {
        //do popcount binary rank directly on smaller part
        uint startOffset = lastBlockOffset;
        uint length = sizeOfLastPartialBlock;
        rank += popcountBinaryRank(startOffset, length, bitmap);
    }

    return rank;

#else

    ulong bitmapwordRank = 0;
    uint wordSize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    vector<bool>::reference ref = (*bitmap)[bitmapOffset];
    ulong initialOffset = 0;
    ulong* wordPtr = ref._M_p;

    //PART OF FIRST WORD if unaligned
    if(ref._M_mask > 1) { //mask = 1 means first part of first word is part of our bitmap, and we can just use the fullword iteration code below
        //create 111110000 type mask from 000010000 type mask
        ulong firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        ulong maskedFirstWord = (*ref._M_p) & firstMask;
        bitmapwordRank += __builtin_popcountl(maskedFirstWord);
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        wordPtr++; ///pointer was to a word we only partially had bits in
    }

    //FULL WORDS
    uint alignedPos = pos - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    uint fullWords = alignedPos / wordSize; //the amount of full words we should iterate through. 
    uint nonBlockFullWordsLeft = 0;
    for(uint i = 0; i < fullWords; i++) {
        if((ulong)wordPtr % (blockSize/CHAR_BIT) != 0) { //check if we are block-aligned
            bitmapwordRank += __builtin_popcountl(*wordPtr);
            wordPtr++;
        } else { //we are block-aligned
            //FULL PRECOMPUTED BLOCKS
            uint fullWordsLeft = fullWords - i;
            uint wordsPerBlock = (blockSize / wordSize);
            uint fullBlocks = fullWordsLeft / wordsPerBlock;
            nonBlockFullWordsLeft = fullWordsLeft % wordsPerBlock;
            uint bitmapMisalignment = CHAR_BIT * ((ulong)bitmap->begin()._M_p % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
            uint wordIndex = (wordPtr - bitmap->begin()._M_p);
            ulong bitmapIndex = wordIndex * sizeof(*wordPtr) * CHAR_BIT;
            ulong blockAlignedOffset = bitmapIndex + bitmapMisalignment;
            uint blockIndex = blockAlignedOffset/blockSize;
            for(uint i = 0; i < fullBlocks; i++) {
                bitmapwordRank += blockRanks[blockIndex];
                blockIndex++;
            }
            wordPtr += fullBlocks * wordsPerBlock;
            break;
        }
    }

    //FULL WORDS LEFT AFTER FULL PAGES
    for(uint i = 0; i < nonBlockFullWordsLeft; i++) {
        bitmapwordRank += __builtin_popcountl(*wordPtr);
        wordPtr++;
    }

    //PART OF LAST WORD (if unaligned)
//    wordPtr++;
    ulong word = *wordPtr;
    ulong shift = alignedPos % wordSize; //if word-aligned, shift will be 0, making mask (below) all 0.
    ulong mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    ulong maskedWord = word & mask; //if word-aligned maskedWord will be 0
    bitmapwordRank += __builtin_popcountl(maskedWord);

    return bitmapwordRank;
#endif
}

ulong Node::binaryRank(ulong pos, bitmap_t* bitmap) {
    int i = 0;
    int rank = 0;
    for(i = 0; i < bitmap->size(); i++) {
        if(i > pos) break;
        bool currentBit = (*bitmap)[i];
        if(currentBit) rank++;
        i++;
    }
    return rank;
}


int Node::leafSelect(int character, ulong occurance, bitmap_t* bitmap, vector<ushort> &blockRanks, uint blockSize) {
    bool charBit = this == parent->right;
    return parent->select(character, charBit, occurance, bitmap, blockRanks, blockSize);
}

int Node::select(int character, bool charBit, ulong occurance, bitmap_t* bitmap,
                 vector<ushort> &blockRanks, uint blockSize) {
    if(parent == nullptr) {
        //we are root
        return popcountBinarySelect(charBit, occurance, bitmap);
    }
    int position = popcountBinarySelect(charBit, occurance, bitmap);
    
    bool parentCharBit = this == parent->right;
    return parent->select(character, parentCharBit, position+1, bitmap, blockRanks, blockSize); //position+1 to go form 0-indexed position to "1-indexed" occurance
}

//int Node::binarySelect(bool charBit, unsigned long occurance) {
//    unsigned long occ = 0;
//    for(unsigned long i = 0; i < bitmapSize; i++) {
//        if((*bitmap)[bitmapOffset+i] == charBit) {
//            if(++occ == occurance) {
//                return i;
//            }
//        }
//    }
//    cout << "Occurance too high!" << endl;
//}

inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    unsigned long occ = 0;
    ulong mask = 1;
    for(unsigned long i = 0; i < sizeof(word) * CHAR_BIT; i++) {
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurance) return i;
        }
        mask <<= 1;
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

int Node::popcountBinarySelect(bool charBit, ulong occurance, bitmap_t* bitmap) {
    ulong occ = 0; //counter for occurances
    
    ulong i;
    ulong wordsize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    
    vector<bool>::reference ref = (*bitmap)[bitmapOffset];
    unsigned long initialOffset = 0;
    unsigned long* firstFullWord = ref._M_p;
    
    //PART OF FIRST WORD if unaligned
    if(ref._M_mask > 1) { //mask = 1 means first part of first word is part of our bitmap, and we can just use the fullword iteration code below
        //create 111110000 type mask from 000010000 type mask
        unsigned long firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        unsigned long maskedFirstWord = (*ref._M_p) & firstMask;
        ulong oneOccInWord = __builtin_popcountl(maskedFirstWord);
        ulong sizeOfMask = __builtin_popcountl(firstMask);
        ulong wordOcc = charBit ? oneOccInWord : sizeOfMask - oneOccInWord;
        if(occ + wordOcc >= occurance) {
            return popcountBinarySelectAux(maskedFirstWord, charBit, occurance - occ);
        } else {
            occ += wordOcc;
        }
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        firstFullWord++; ///pointer was to a word we only partially had bits in
    }
    
    //FULL WORDS
    unsigned int alignedPos = bitmapSize - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    unsigned long fullWords = alignedPos / wordsize; //the amount of full words we should iterate through. 
    for(i = 0; i < fullWords; i++) {
        unsigned long word = *(firstFullWord + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occ + wordOcc >= occurance) {
            ulong pos = initialOffset + i*wordsize;
            return pos + popcountBinarySelectAux(word, charBit, occurance - occ);
        } else {
            occ += wordOcc;
        }
    } //we believe i is incremented even after the condition has failed
    
    //PART OF LAST WORD (if unaligned)
    unsigned long word = *(firstFullWord + i);
    unsigned long shift = alignedPos % wordsize; //if word-aligned, shift will be 0, making mask (below) all 0.
    unsigned long mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    unsigned long maskedWord = word & mask; //if word-aligned maskedWord will be 0
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = initialOffset + i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
    } else {
        occ += wordOcc;
    }
}



Node* Node::getLeaf(int character, int alphabetMin, int alphabetMax) {
    if(isLeaf){
        return this;
    }

    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (int)((alphabetSize-1)/2 + alphabetMin);
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;

    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax);
    } else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax);
    } else {
        cout << "Error: both child node pointers are null!" << endl;
    }

    return leaf;
}


//adapted from third reply here http://www.dreamincode.net/forums/topic/193179-bit-masking-in-c/
inline void Node::showBits(unsigned long n) {
    unsigned long mask = 1UL << ((8 * sizeof(unsigned long))-1);

//    printf("\t%lu\t = ", n);
    while(mask>0) {
            printf("%d", (n&mask)?1:0);
            mask >>= 1;
    }
    printf("\n");
}