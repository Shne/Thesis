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
        Node* &node_pt, bitmap_t* in_bitmap, unsigned long &in_bitmapOffset, float skew)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
    
    uint alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << (*input)[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    bitmapSize = input->size(); //one bit for each character in the input string
    bitmapOffset = in_bitmapOffset;
   
    uint split = (uint) ((alphabetSize-1)/skew) + alphabetMin;

    uint leftAlphabetMin = alphabetMin; 
    uint leftAlphabetMax = split;
    uint rightAlphabetMin = split+1;
    uint rightAlphabetMax = alphabetMax;
    
//    cout << in_bitmapOffset << endl;
    vector<uint>* leftString = new vector<uint>();
    vector<uint>* rightString = new vector<uint>();
//    cout << input->size() << endl;
    
    for(auto it = input->begin(); it != input->end(); it++, in_bitmapOffset++) {
        uint currentChar = *it;
        if(currentChar <= split) {
            (*in_bitmap)[in_bitmapOffset] = false;
            leftString->push_back(currentChar);
        } else {
            (*in_bitmap)[in_bitmapOffset] = true;
            rightString->push_back(currentChar);
        }
    }
    
//    stringstream str, leftstr, rightstr;
//    copy(input->begin(), input->end(), ostream_iterator<int>(str, " "));
//    copy(leftString->begin(), leftString->end(), ostream_iterator<int>(leftstr, " "));
//    copy(rightString->begin(), rightString->end(), ostream_iterator<int>(rightstr, " "));
//    cout << "string:\t\t" << str.str() << endl;
//    cout << "split char:\t" << split << endl;
//    cout << "left alphabet:\t[" << leftAlphabetMin << ", " << leftAlphabetMax << "]" << endl;
//    cout << "right alphabet:\t[" << rightAlphabetMin << ", " << rightAlphabetMax << "]" << endl;
//    cout << "left string:\t" << leftstr.str() << endl;
//    cout << "right string:\t" << rightstr.str() << endl;
//    cout << "---------------" << endl;
    
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
        right = new (node_pt) Node(rightString, rightAlphabetMin, rightAlphabetMax, this, node_pt, in_bitmap, in_bitmapOffset, skew);
    } else {
        rightString->clear();
        delete rightString;
    }
    //same for left. node_pt and bitmap_it should have been incrememented by our right subnode to point to free space now.
    if(leftString->size() != 0) {
        node_pt++;
        left = new (node_pt) Node(leftString, leftAlphabetMin, leftAlphabetMax, this, node_pt, in_bitmap, in_bitmapOffset, skew);
    } else {
        leftString->clear();
        delete leftString;
    }
}


uint Node::rank(int character, unsigned long index, bitmap_t* bitmap, int alphabetMin, int alphabetMax, float skew){
    if(isLeaf) return index;
    if(index == 0) return index;
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (int)((alphabetSize-1)/skew + alphabetMin);
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos;// = charBit ? popcountBinaryRank(index, bitmap) : index - popcountBinaryRank(index, bitmap);
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
        pos = popcountBinaryRank(index, bitmap);
        rank = right->rank(character, pos, bitmap, rightAlphabetMin, rightAlphabetMax, skew);
    }else if(left != nullptr){
        pos = index - popcountBinaryRank(index, bitmap);
        rank = left->rank(character, pos, bitmap, leftAlphabetMin, leftAlphabetMax, skew);
    }
    
    return rank;
}

ulong Node::popcountBinaryRank(unsigned long pos, bitmap_t* bitmap) {
    if(pos > bitmapSize) cout << "position " << pos << " larger than bitmapsize " << bitmapSize << endl;
    unsigned long bitmapwordRank = 0;
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    
    vector<bool>::reference ref = (*bitmap)[bitmapOffset];
    unsigned long initialOffset = 0;
    unsigned long* firstFullWord = ref._M_p;
    
    //SMALL POS
    if(pos < wordsize) {
        return binaryRank(ref, pos);
    }
    
    //PART OF FIRST WORD if unaligned
    if(ref._M_mask > 1) { //mask = 1 means first part of first word is part of our bitmap, and we can just use the fullword iteration code below
        //create 111110000 type mask from 000010000 type mask
        unsigned long firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        unsigned long maskedFirstWord = (*ref._M_p) & firstMask;
        bitmapwordRank += __builtin_popcountl(maskedFirstWord);
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        firstFullWord++; ///pointer was to a word we only partially had bits in
    }
    
    //FULL WORDS
    unsigned long alignedPos = pos - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    unsigned long fullWords = alignedPos / wordsize; //the amount of full words we should iterate through. 
    for(i = 0; i < fullWords; i++) {
        unsigned long word = *(firstFullWord + i);
        bitmapwordRank += __builtin_popcountl(word);
    } //we believe i is incremented even after the condition has failed
    
    //PART OF LAST WORD (if unaligned)
    unsigned long word = *(firstFullWord + i);
    unsigned long shift = alignedPos % wordsize; //if word-aligned, shift will be 0, making mask (below) all 0.
    unsigned long mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    unsigned long maskedWord = word & mask; //if word-aligned maskedWord will be 0
    bitmapwordRank += __builtin_popcountl(maskedWord);
    
    return bitmapwordRank;
}

ulong Node::binaryRank(vector<bool>::reference ref, ulong length) {
    ulong startMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up are 1
    ulong endMask = (ref._M_mask << length)-1UL; //bit at 0-indexed position offset+length-1 and down are 1
    ulong maskedWord = ((*ref._M_p) & startMask) & endMask;
    return __builtin_popcountl(maskedWord);
}


uint Node::leafSelect(int character, unsigned long occurance, bitmap_t* bitmap) {
    bool charBit = this == parent->right;
    return parent->select(character, charBit, occurance, bitmap);
}

uint Node::select(int character, bool charBit, unsigned long occurance, bitmap_t* bitmap) {
    if(parent == nullptr) {
        //we are root
        return popcountBinarySelect(charBit, occurance, bitmap);
    }
    int position = popcountBinarySelect(charBit, occurance, bitmap);

    bool parentCharBit = this == parent->right;
    return parent->select(character, parentCharBit, position+1, bitmap); //position+1 to go form 0-indexed position to "1-indexed" occurance
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

inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance, ulong mask) {
    ulong occ = 0;
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

uint Node::popcountBinarySelect(bool charBit, ulong occurrence, bitmap_t* bitmap) {
    ulong occ = 0; //counter for occurances
    
    ulong wordsize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    
    vector<bool>::reference ref = (*bitmap)[bitmapOffset];
    ulong initialOffset = 0;
    ulong* firstFullWord = ref._M_p;
    
    //PART OF FIRST WORD if unaligned
    if(ref._M_mask > 1) { //mask = 1 means first part of first word is part of our bitmap, and we can just use the fullword iteration code below
        //create 111110000 type mask from 000010000 type mask
        ulong firstMask = ~(ref._M_mask - 1UL); //the bit of _M_mask and up
        ulong maskedFirstWord = (*ref._M_p) & firstMask;
        ulong occInWord = __builtin_popcountl(maskedFirstWord);
        ulong sizeOfMask = __builtin_popcountl(firstMask);
        ulong wordOcc = charBit ? occInWord : sizeOfMask - occInWord;
        if(wordOcc >= occurrence) {
            return popcountBinarySelectAux(maskedFirstWord, charBit, occurrence, ref._M_mask);
        } else {
            occ += wordOcc;
        }
        initialOffset = __builtin_popcountl(firstMask); //the amount we should skip for our calculation of fullWords
        firstFullWord++; ///pointer was to a word we only partially had bits in
    }
    
    //FULL WORDS
    ulong alignedPos = bitmapSize - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
    uint fullWords = alignedPos / wordsize; //the amount of full words we should iterate through. 
    for(uint i = 0; i < fullWords; i++) {
        ulong word = *(firstFullWord + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occ + wordOcc >= occurrence) {
            ulong pos = initialOffset + i*wordsize;
            return pos + popcountBinarySelectAux(word, charBit, occurrence - occ, 1UL);
        } else {
            occ += wordOcc;
        }
    } //we believe i is incremented even after the condition has failed
    
    //PART OF LAST WORD (if unaligned)
    ulong word = *(firstFullWord + fullWords);
    uint shift = alignedPos % wordsize; //if word-aligned, shift will be 0, making mask (below) all 0.
    ulong mask = (1UL << shift)-1UL; //if word-aligned mask will be 0
    ulong maskedWord = word & mask; //if word-aligned maskedWord will be 0
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurrence) {
        ulong pos = initialOffset + fullWords*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurrence - occ, 1UL);
    } else {
        occ += wordOcc;
    }
}



Node* Node::getLeaf(int character, int alphabetMin, int alphabetMax, float skew) {
    if(isLeaf){
        return this;
    }

    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (int)((alphabetSize-1)/skew + alphabetMin);
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;

    bool charBit = character > split;

    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax, skew);
    } else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax, skew);
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