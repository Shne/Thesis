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

Node::Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode)
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
    
    for(auto it = input->begin(); it != input->end(); it++) {
        int currentChar = *it;        
        if(currentChar <= split) {
            bitmap.push_back(false);
            leftString->push_back(currentChar);
        } else {
            bitmap.push_back(true);
            rightString->push_back(currentChar);
        }
    }
    
    bitmap.shrink_to_fit();
    
    input->clear();
    delete input;
    if(rightString->size() > 0) {
        right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this);
    } else {
        rightString->clear();
        delete rightString;
    }
    if(leftString->size() > 0) {
        left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this);
    } else {
        leftString->clear();
        delete leftString;
    }
}


int Node::rank(uint character, ulong index, uint alphabetMin, uint alphabetMax){
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
    ulong pos;
    ulong rank = 0;
    if(charBit && right != nullptr) {
//        pos = binaryRank(index);
        pos = popcountBinaryRank(index);
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
//        pos = index - binaryRank(index);
        pos = index - popcountBinaryRank(index);
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }
    
    return rank;
}

ulong Node::popcountBinaryRank(ulong pos) {
    if(pos > bitmap.size()) cout << "position " << pos << " larger than bitmapsize " << bitmap.size() << endl;
    ulong bitmapwordRank = 0;
    
    ulong i;
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = pos / wordsize;
    
    for(i = 0; i < fullWords; i++) {
        ulong word = *(bitmap.begin()._M_p + i);
        bitmapwordRank += __builtin_popcountl(word);
    }
    ulong word = *(bitmap.begin()._M_p + i);    
    ulong shift = (pos % wordsize);
    ulong mask = (1UL << shift)-1;
    
    ulong maskedWord = word & mask;
    bitmapwordRank += __builtin_popcountl(maskedWord);
    return bitmapwordRank;
}

ulong Node::binaryRank(ulong pos) {
    uint i = 1;
    uint rank = 0;
    for(auto it = bitmap.begin(); it != bitmap.end(); it++) {
        if(i > pos) break;
        bool currentBit = *it;
        if(currentBit) rank++;
        i++;
    }
    return rank;
}


uint Node::leafSelect(uint character, ulong occurance) {
    //a leaf has no bitmap
    bool charBit = this == parent->right;
    return parent->select(charBit, occurance);
}

uint Node::select(bool charBit, ulong occurance) {
    if(parent == nullptr) {
        //we are root
        return popcountBinarySelect(charBit, occurance);
//        return binarySelect(charBit, occurance);
    }
    uint position = popcountBinarySelect(charBit, occurance);
//    uint position = binarySelect(charBit, occurance);
    bool parentCharBit = this == parent->right;
    return parent->select(parentCharBit, position+1);
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




inline ulong popcountBinarySelectAux(ulong word, bool charBit, ulong occurance) {
    ulong occ = 0;
    ulong mask = 1;
    for(ulong i = 0; i < sizeof(word) * CHAR_BIT; i++) {
        bool bit = (word & mask) > 0;
        if(bit == charBit) {
            if(++occ == occurance) return i;
        }
        mask <<= 1;
    }
    cout << "Occurance " << occurance << " too high! saw " << occ << endl;
}

ulong Node::popcountBinarySelect(bool charBit, ulong occurance) {
    ulong occ = 0; //counter for occurances
    
    ulong i, pos;
    ulong wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    ulong fullWords = bitmap.size() / wordsize;
    
    for(i = 0; i < fullWords; i++) {
        ulong word = *(bitmap.begin()._M_p + i);
        ulong wordOcc = charBit ? __builtin_popcountl(word) : wordsize - __builtin_popcountl(word);
        if(occ + wordOcc >= occurance) {
            pos = i*wordsize;
            return pos + popcountBinarySelectAux(word, charBit, occurance - occ);
        } else {
            occ += wordOcc;
        }
    }
    
    //part of last word if unaligned
    pos = i*wordsize;
    ulong word = *(bitmap.begin()._M_p + i);
    ulong shift = (bitmap.size() % wordsize);
    ulong mask = (1UL << shift)-1;
    ulong maskedWord = word & mask;
    ulong wordOcc = charBit ? __builtin_popcountl(maskedWord) : __builtin_popcountl(mask) - __builtin_popcountl(maskedWord);
    if(occ + wordOcc >= occurance) {
        ulong pos = i*wordsize;
        return pos + popcountBinarySelectAux(maskedWord, charBit, occurance - occ);
    } else {
        occ += wordOcc;
    }
}
