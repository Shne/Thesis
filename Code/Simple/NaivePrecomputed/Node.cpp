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

Node::Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode, uint blockSize)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {

    uint alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
        isLeaf = true;
        return;
    }

    uint split = (uint)((alphabetSize-1)/2 + alphabetMin);
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;
    
    assert(leftAlphabetMin <= leftAlphabetMax);
    assert(rightAlphabetMin <= rightAlphabetMax);
    
    vector<uint>* leftString = new vector<uint>;
    vector<uint>* rightString = new vector<uint>;
    
    uint blockRanksSize = (input->size()/blockSize)+2; //+2 to have space for first and last unaligned
    blockRanks = blockRanksVector(blockRanksSize, 0);
    bitmap = bitmap_t(input->size(), false);
    
    uint bitmapMisalignment = CHAR_BIT * (((ulong)bitmap.begin()._M_p) % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
    
    uint i = 0;
    for(auto it = input->begin(); it != input->end(); it++, i++) {
        uint currentChar = *it;
        if(currentChar <= split) {
            bitmap[i] = false;
            leftString->push_back(currentChar);
        } else {
            uint blockAlignedOffset = i + bitmapMisalignment;
            uint blockIndex = blockAlignedOffset / blockSize;
            blockRanks[blockIndex] += 1;
            bitmap[i] = true;
            rightString->push_back(currentChar);
        }
    }
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this, blockSize);
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this, blockSize);
    } else {
        leftString->clear();
        delete leftString;
    }
}


uint Node::rank(uint character, uint index, uint alphabetMin, uint alphabetMax, uint blockSize){
    if(isLeaf){
        return index;
    }
    
    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (uint)((alphabetSize-1)/2 + alphabetMin);
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    uint pos;
    uint rank = 0;
    if(charBit && right != nullptr) {
//        pos = binaryRank(index);
//        pos = popcountBinaryRank(0, index);
        pos = blockBinaryRank(index, blockSize);
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax, blockSize);
    }else if(left != nullptr){
//        pos = index - binaryRank(index);
//        pos = index - popcountBinaryRank(0, index);
        pos = index - blockBinaryRank(index, blockSize);
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax, blockSize);
    }
    
    return rank;
}


uint Node::blockBinaryRank(uint pos, uint blockSize) {
    uint bitmapMisalignment = CHAR_BIT * ((ulong)bitmap.begin()._M_p % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
    uint lengthToNextBlockAlignment = (blockSize - bitmapMisalignment) % blockSize; //modulo so it's 0 when bitmapMisalignment is 0

    //SMALL POS
    if(pos < lengthToNextBlockAlignment) {
        return popcountBinaryRank(0, pos);
    }
    
    //FIRST PART
    uint rank = 0;
    if(lengthToNextBlockAlignment != 0) {
        rank += blockRanks[0];
    }
    
    uint fullBlocks = (pos - lengthToNextBlockAlignment) / blockSize;
    //FULL BLOCKS
    uint blockIndex = (bitmapMisalignment + lengthToNextBlockAlignment) / blockSize;
    for(uint i = 0; i < fullBlocks; i++) {
        rank += blockRanks[blockIndex];
        blockIndex++;
    }
    
    //LAST PART
    uint offset = lengthToNextBlockAlignment + fullBlocks * blockSize;
    uint length = pos - offset;
    rank += popcountBinaryRank(offset, length);
    return rank;
}

ulong Node::popcountBinaryRank(uint offset, uint length) {
    assert(offset + length <= bitmap.size());
    ulong rank = 0;

    vector<bool>::reference ref = bitmap[offset];
    ulong* wordPtr = ref._M_p;
    ulong wordsize = sizeof(*wordPtr) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    uint initialOffset = 0;
    
    if(length < wordsize) {
        return binaryRank(offset, length);
    }
    
    //MISALIGNED FIRST PART
    if(offset % wordsize != 0) {
        ulong firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        ulong maskedFirstWord = (*ref._M_p) & firstMask;
        rank += __builtin_popcountl(maskedFirstWord);
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        wordPtr++;
    }
    
    //FULL WORDS
    uint alignedPos = length - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    ulong fullWords = (length - initialOffset) / wordsize;
    for(uint i = 0; i < fullWords; i++) {
        rank += __builtin_popcountl(*wordPtr);
        wordPtr++;
    }
    
    //PART OF LAST WORD (if unaligned)
    ulong word = *wordPtr;
    ulong shift = alignedPos % wordsize; //if word-aligned, shift will be 0, making mask (below) all 0.
    ulong mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    ulong maskedWord = word & mask; //if word-aligned maskedWord will be 0
    rank += __builtin_popcountl(maskedWord);
    return rank;
}

uint Node::binaryRank(uint offset, uint length) {
    int rank = 0;
    for(uint i = offset; i < offset + length; i++) {
        bool currentBit = bitmap[i];
        if(currentBit) rank++;
    }
    return rank;
}

uint Node::leafSelect(uint character, ulong occurrence, uint blockSize) {
    //a leaf has no bitmap
    bool charBit = this == parent->right;
    return parent->select(charBit, occurrence, blockSize);
}

uint Node::select(bool charBit, ulong occurrence, uint blockSize) {
    if(parent == nullptr) {
        //we are root
        return blockBinarySelect(charBit, occurrence, blockSize);
//        return popcountBinarySelect(charBit, occurrence);
//        return binarySelect(charBit, occurance);
    }
    uint position = blockBinarySelect(charBit, occurrence, blockSize);
//    uint position = popcountBinarySelect(charBit, occurrence);
//    uint position = binarySelect(charBit, occurance);
    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1, blockSize);
}

uint Node::binarySelect(bool charBit, ulong occurance) {
    ulong occ = 0;
    for(ulong i = 0; i < bitmap.size(); i++) {
        if(bitmap[i] == charBit) { 
            if(++occ == occurance) {
                return i;
            }
        }
    }
    cout << "Occurance too high!" << endl;
}

Node* Node::getLeaf(uint character, uint alphabetMin, uint alphabetMax) {
    if(isLeaf){
        return this;
    }

    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (uint)((alphabetSize-1)/2 + alphabetMin);
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;

    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }

    return leaf;
}




uint Node::blockBinarySelect(bool charBit, uint occurrence, uint blockSize) {
    uint bitmapMisalignment = CHAR_BIT * ((ulong)bitmap.begin()._M_p % (blockSize/CHAR_BIT)); //how far inside a block the bitmap starts, in bits
    uint lengthToNextBlockalignment = (blockSize - bitmapMisalignment) % blockSize; //modulo so it's 0 when blockMisalignment is 0
    
    //SMALL BITMAPS
    if(bitmap.size() < lengthToNextBlockalignment) {
        return popcountBinarySelect(charBit, occurrence, 0);
    }
    
    uint offset = 0;
    uint occCounter = 0;
    
    //FIRST PART
    uint firstBlockRank = charBit ? blockRanks[0] : lengthToNextBlockalignment - blockRanks[0];
    if(firstBlockRank < occurrence) {
        offset += lengthToNextBlockalignment;
        occCounter += firstBlockRank;
    } else {
        return popcountBinarySelect(charBit, occurrence, offset);
    }
    
    //FULL BLOCKS
    for(uint i = 1; i < blockRanks.size(); i++) {
        uint thisBlockRank = charBit ? blockRanks[i] : blockSize - blockRanks[i];
        if(occCounter + thisBlockRank < occurrence) {
            offset += blockSize;
            occCounter += thisBlockRank;
        } else {
            uint occLeft = occurrence - occCounter;
            return offset + popcountBinarySelect(charBit, occLeft, offset);
        }
    }

    cout << "Error: occurrence " << occurrence << " too high!" << endl;
}


inline uint popcountBinarySelectAux(ulong word, bool charBit, uint occurance, ulong mask) {
    uint occ = 0;
    uint startAt = __builtin_ffsl(mask) - 1; //-1 because it returns 1 + index of bit
    for(uint i = startAt; i < sizeof(word) * CHAR_BIT; i++) {
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurance) return i - startAt;
        }
        mask <<= 1;
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

uint Node::popcountBinarySelect(bool charBit, uint occurrence, uint offset) {
    uint occCounter = 0; //counter for occurances

    uint wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    vector<bool>::reference ref = bitmap[offset];
    unsigned long initialOffset = 0;
    unsigned long* firstFullWord = ref._M_p;
    
    //PART OF FIRST WORD if unaligned
    if(ref._M_mask > 1) { //mask = 1 means first part of first word is part of our bitmap, and we can just use the fullword iteration code below
        //create 111110000 type mask from 000010000 type mask
        ulong firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        ulong maskedFirstWord = (*ref._M_p) & firstMask;
        int occInWord = __builtin_popcountl(maskedFirstWord);
        int sizeOfMask = __builtin_popcountl(firstMask);
        int wordOcc = charBit ? occInWord : sizeOfMask - occInWord;
        if(wordOcc >= occurrence) {
            return popcountBinarySelectAux(maskedFirstWord, charBit, occurrence, ref._M_mask);
        } else {
            occCounter += wordOcc;
        }
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        firstFullWord++; ///pointer was to a word we only partially had bits in
    }
    
    //FULL WORDS
    uint alignedPos = bitmap.size() - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    uint fullWords = alignedPos / wordsize; //the amount of full words we should iterate through. 
    for(uint i = 0; i < fullWords; i++) {
        ulong word = *(firstFullWord + i);
        uint wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occCounter + wordOcc >= occurrence) {
            uint pos = initialOffset + i*wordsize;
            return pos + popcountBinarySelectAux(word, charBit, occurrence - occCounter, 1UL);
        } else {
            occCounter += wordOcc;
        }
    } //we believe i is incremented even after the condition has failed
    
    //PART OF LAST WORD (if unaligned)
    ulong word = *(firstFullWord + fullWords);
    uint shift = alignedPos % wordsize; //if word-aligned, shift will be 0, making mask (below) all 0.
    ulong mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    ulong maskedWord = word & mask; //if word-aligned maskedWord will be 0
    uint wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occCounter + wordOcc >= occurrence) {
        uint pos = initialOffset + fullWords*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurrence - occCounter, 1UL);
    } else {
        occCounter += wordOcc;
    }
}