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

Node::Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode, uint blockSize, Node* &node_pt, float skew)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {

    uint alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
        isLeaf = true;
        return;
    }

    uint split = (uint) ((alphabetSize-1)/skew) + alphabetMin;
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;
    
    assert(leftAlphabetMin <= leftAlphabetMax);
    assert(rightAlphabetMin <= rightAlphabetMax);
    
    vector<uint>* leftString = new vector<uint>;
    vector<uint>* rightString = new vector<uint>;
    
    uint blockRanksSize = (input->size()/blockSize)+1; //+1 to have space for last unaligned
    blockRanks = blockRanksVector(blockRanksSize, 0);
    bitmap = bitmap_t(input->size(), false);
    
    uint i = 0;
    for(auto it = input->begin(); it != input->end(); it++, i++) {
        uint currentChar = *it;
        if(currentChar <= split) {
            leftString->push_back(currentChar);
        } else {
            uint blockIndex = i / blockSize;
            blockRanks[blockIndex] += 1;
            bitmap[i] = true;
            rightString->push_back(currentChar);
        }
    }
    
    for(auto it = blockRanks.begin()+1; it < blockRanks.end(); it++) { //+1 because first block doesn't need anything added
        *it += *(it-1); //add value from previous block
    }
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
        node_pt++;
        right = new (node_pt) Node(rightString, rightAlphabetMin, rightAlphabetMax, this, blockSize, node_pt, skew);
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
        node_pt++;
        left = new (node_pt) Node(leftString, leftAlphabetMin, leftAlphabetMax, this, blockSize, node_pt, skew);
    } else {
        leftString->clear();
        delete leftString;
    }
}


uint Node::rank(uint character, uint index, uint alphabetMin, uint alphabetMax, uint blockSize, float skew){
    if(isLeaf){
        return index;
    }
    
    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (uint)((alphabetSize-1)/skew + alphabetMin);
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
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax, blockSize, skew);
    }else if(left != nullptr){
//        pos = index - binaryRank(index);
//        pos = index - popcountBinaryRank(0, index);
        pos = index - blockBinaryRank(index, blockSize);
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax, blockSize, skew);
    }
    
    return rank;
}


uint Node::blockBinaryRank(uint pos, uint blockSize) {
    //SMALL POS
    if(pos < blockSize) {
        return popcountBinaryRank(0, pos);
    }

    //BLOCKRANKS LOOKUP
    uint blockIndex = pos / blockSize;
    uint rank = blockRanks[blockIndex-1];
    
    //LAST PART
    uint offset = blockIndex * blockSize;
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
        return binaryRank(ref, length);
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

uint Node::binaryRank(vector<bool>::reference ref, uint length) {
    ulong startMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up are 1
    ulong endMask = (ref._M_mask << length)-1UL; //bit at 0-indexed position offset+length-1 and down are 1
    ulong maskedWord = ((*ref._M_p) & startMask) & endMask;
    return __builtin_popcountl(maskedWord);
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
    }
    uint position = blockBinarySelect(charBit, occurrence, blockSize);
    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1, blockSize);
}

uint Node::binarySelect(bool charBit, ulong occurrence) {
    ulong occ = 0;
    for(ulong i = 0; i < bitmap.size(); i++) {
        if(bitmap[i] == charBit) { 
            if(++occ == occurrence) {
                return i;
            }
        }
    }
    cout << "Occurance too high!" << endl;
}

Node* Node::getLeaf(uint character, uint alphabetMin, uint alphabetMax, float skew) {
    if(isLeaf){
        return this;
    }

    uint alphabetSize = alphabetMax - alphabetMin +1;
    uint split = (uint)((alphabetSize-1)/skew + alphabetMin);
    uint leftAlphabetMin = alphabetMin;
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;

    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax, skew); //right sub tree
    }else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax, skew); //right sub tree
    }

    return leaf;
}




uint Node::blockBinarySelect(bool charBit, uint occurrence, uint blockSize) {
#ifdef BRANCHLESSSELECT
    //SMALL BITMAPS
    if(blockRanks.size() < 2) {
        return popcountBinarySelect(charBit, occurrence, 0);
    }

    //BINARY SEARCH
    uint searchBlockIndex = blockRanks.size()/2;
    uint blockJump = searchBlockIndex;
    uint rank, bitsCovered;
    do {
        blockJump = blockJump/2 + blockJump%2; //round up or it will not be able to reach all positions
        bitsCovered = (searchBlockIndex+1)*blockSize;
        rank = labs(charBit*bitsCovered - (bitsCovered - (long)blockRanks[searchBlockIndex])); //branch-free rank1 or rank0 depending on charBit
        int positiveNegative = ((-0.5f) + (rank < occurrence)) * 2; //positiveNegative should be -1 when rank >= occurrence and otherwise 1
        assert(positiveNegative == -1 || positiveNegative == 1);
        uint searchBlockIndexPreview = searchBlockIndex+positiveNegative*blockJump;
        short searchBlockIndexPreviewValid = searchBlockIndexPreview >= 0 && searchBlockIndexPreview < blockRanks.size(); //1 if valid index, 0 if invalid
        searchBlockIndex += positiveNegative * blockJump * searchBlockIndexPreviewValid; //doesn't change searchBlockIndex if new index would be invalid, branch-free
        assert(searchBlockIndex < 4000000000); //underflow test
    } while(blockJump > 1);
    
    //last correctuve jump by either -1, 0 or 1 that handles array bounderies
    bitsCovered = (searchBlockIndex+1)*blockSize;
    rank = labs(charBit * bitsCovered - (bitsCovered - (long)blockRanks[searchBlockIndex])); //branch-free rank1 or rank0 depending on charBit
    int positiveNegative = ((-0.5f) + (rank < occurrence)) * 2; //positiveNegative should be -1 when rank >= occurrence and otherwise 1
    short blockIndexValid = (searchBlockIndex+positiveNegative) >= 0 && (searchBlockIndex+positiveNegative) < blockRanks.size(); //0 if invalid index, 1 otherwise
    searchBlockIndex += positiveNegative * blockIndexValid; //doesn't change searchBlockIndex if new index would be invalid, branch-free   
    
    //Calculate occurrences left by using rank up to this block
    int previousBlockIndex = searchBlockIndex - 1;
    short blockIndexPositive = previousBlockIndex >= 0; //0 when blockIndex is negative, 1 otherwise
    bitsCovered = (previousBlockIndex+1)*blockSize;
    uint prevRank = labs(charBit*bitsCovered - (bitsCovered - (long)blockRanks[previousBlockIndex*blockIndexPositive])); //branch-free rank1 or rank0 depending on charBit
    uint occLeft = occurrence - prevRank * blockIndexPositive; //= occurrence if prev index would be below 0, branch-free
    assert(prevRank*blockIndexPositive < nextRank);
    
    //Calculate and return position
    uint offset = searchBlockIndex * blockSize;
    return offset + popcountBinarySelect(charBit, occLeft, offset);
#else
    //SMALL BITMAPS
    if(blockRanks.size() < 2) {
        return popcountBinarySelect(charBit, occurrence, 0);
    }

    //BINARY SEARCH
    uint searchBlockIndex = blockRanks.size()/2;
    uint blockJump = searchBlockIndex;
    uint rank, bitsCovered;
    while(true) {
        bitsCovered = (searchBlockIndex+1)*blockSize;
        rank = charBit ? blockRanks[searchBlockIndex] : bitsCovered - blockRanks[searchBlockIndex];
        bool prevRankBelow;
        if(searchBlockIndex != 0) {
            bitsCovered = searchBlockIndex*blockSize;
            uint prevRank = charBit ? blockRanks[searchBlockIndex-1] : bitsCovered - blockRanks[searchBlockIndex-1];
            prevRankBelow = prevRank < occurrence;
        } else {
            prevRankBelow = true;
        }
        if(rank >= occurrence && prevRankBelow) {
            break;
        }
        blockJump = blockJump/2 + blockJump%2; //round up or it will not be able to reach all positions
        
        if(rank < occurrence) {
            if(searchBlockIndex + blockJump <= blockRanks.size()-1) {
                searchBlockIndex += blockJump;
            } else {
                searchBlockIndex = blockRanks.size() - 1;
            }
        } else {
            if((long)searchBlockIndex - blockJump >= 0) {
                searchBlockIndex -= blockJump;
            } else {
                searchBlockIndex = 0;
            }
        }
        assert(searchBlockIndex < 4000000000); //underflow test
    }

    //Calculate occurrences left by using rank up to this block
    int previousBlockIndex = searchBlockIndex - 1;
    bitsCovered = (previousBlockIndex+1)*blockSize;
    uint prevRank = searchBlockIndex == 0 ? 0 : charBit ? blockRanks[previousBlockIndex] : bitsCovered - blockRanks[previousBlockIndex];
    uint occLeft = occurrence - prevRank;
    bitsCovered = (searchBlockIndex+1) * blockSize;
    rank = charBit ? blockRanks[searchBlockIndex] : bitsCovered - blockRanks[searchBlockIndex];
    assert(prevRank <= rank);
    
    //Calculate and return position
    uint offset = searchBlockIndex * blockSize;
    return offset + popcountBinarySelect(charBit, occLeft, offset);
    
#endif
}


inline uint popcountBinarySelectAux(ulong word, bool charBit, uint occurrence, ulong mask) {
    uint occ = 0;
    uint startAt = __builtin_ffsl(mask) - 1; //-1 because it returns 1 + index of bit
    for(uint i = startAt; i < sizeof(word) * CHAR_BIT; i++) {
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurrence) return i - startAt;
        }
        mask <<= 1;
    }
    cout << "Occurance " << occurrence << " too high! saw " << occ << endl;
    assert(false);
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