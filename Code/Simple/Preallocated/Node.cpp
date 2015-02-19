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

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode,
        Node* &node_pt, bitmap_t* in_bitmap, unsigned long &in_bitmapOffset)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
//    if(input.size() == 0) {
//        cout << "Empty Node" << endl;
//        return;
//    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << (*input)[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    bitmap = in_bitmap;
    bitmapSize = input->size(); //one bit for each character in the input string
    bitmapOffset = in_bitmapOffset;
   
    int split = (alphabetSize-1)/SKEW + alphabetMin;

    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
//    cout << in_bitmapOffset << endl;
    vector<int>* leftString = new vector<int>();
    vector<int>* rightString = new vector<int>();
//    cout << input->size() << endl;
    
    for(auto it = input->begin(); it != input->end(); it++, in_bitmapOffset++) {
        int currentChar = *it;
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
    
    if(rightString->size() == 0 || leftString->size() == 0) {
        //then kinda ignore us; reset bitmap offset
        in_bitmapOffset = bitmapOffset;
        bitmap = nullptr;
        bitmapSize = 0;
    }
    
    //construct node, save it at right pointer location. give it incremented node_pt and bitmap_it so they point to free space.
    if(rightString->size() != 0) {
        node_pt++; //increment to free space
        right = node_pt; //store pointer to right node
        new (node_pt) Node(rightString, rightAlphabetMin, rightAlphabetMax, this, node_pt, in_bitmap, in_bitmapOffset);
    } else {
        delete rightString;
    }
    //same for left. node_pt and bitmap_it should have been incrememented by our right subnode to point to free space now.
    if(leftString->size() != 0) {
        node_pt++;
        left = node_pt;
        new (node_pt) Node(leftString, leftAlphabetMin, leftAlphabetMax, this, node_pt, in_bitmap, in_bitmapOffset);
    } else {
        delete leftString;
    }
}


int Node::rank(int character, unsigned long index, int alphabetMin, int alphabetMax){
    if(isLeaf){
//        cout << "Rank Leaf" << endl;
        return index;
    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (alphabetSize-1)/SKEW + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character > split;
    unsigned long pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
    unsigned long rank = 0;
    if(charBit && right != nullptr) {
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }
    
    return rank;
}

unsigned long Node::binaryRankPopcountInstruction(unsigned long pos) {
    if(pos > bitmapSize) cout << "position " << pos << " larger than bitmapsize " << bitmapSize << endl;
    unsigned long bitmapwordRank = 0;
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap->begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    
    vector<bool>::reference ref = (*bitmap)[bitmapOffset];
    unsigned long initialOffset = 0;
    unsigned long* firstFullWord = ref._M_p;
    
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
    unsigned int alignedPos = pos - initialOffset; //initialOffset is the amount of bits in the first unaligned word of our bitmap
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


int Node::leafSelect(int character, unsigned long occurance) {
    bool charBit = this == parent->right;
    return parent->select(character, charBit, occurance);
}

int Node::select(int character, bool charBit, unsigned long occurance) {
    if(parent == nullptr) {
        //we are root
        return binarySelect(charBit, occurance);
    }
    int position = binarySelect(charBit, occurance);
    
    bool parentCharBit = this == parent->right;
    return parent->select(character, parentCharBit, position+1); //position+1 to go form 0-indexed position to "1-indexed" occurance
}

int Node::binarySelect(bool charBit, unsigned long occurance) {
    unsigned long occ = 0;
    for(unsigned long i = 0; i < bitmapSize; i++) {
        if((*bitmap)[bitmapOffset+i] == charBit) {
            if(++occ == occurance) {
                return i;
            }
        }
    }
    cout << "Occurance too high!" << endl;
}

Node* Node::getLeaf(int character, int alphabetMin, int alphabetMax) {
    if(isLeaf){
        return this;
    }

    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (alphabetSize-1)/SKEW + alphabetMin;
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