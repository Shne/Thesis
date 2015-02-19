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

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode)
    : isLeaf(false), left(nullptr), right(nullptr), parent(parentNode) {
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << (*input)[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
   
    int split = (alphabetSize-1)/SKEW + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int>* leftString = new vector<int>;
    vector<int>* rightString = new vector<int>;
    
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
    if(pos > bitmap.size()) cout << "position " << pos << " larger than bitmapsize " << bitmap.size() << endl;
    unsigned long bitmapwordRank = 0;
    
    unsigned long i;
    unsigned long wordsize = sizeof(*bitmap.begin()._M_p) * CHAR_BIT; //vector<bool> src uses CHAR_BIT too
    unsigned long fullWords = pos / wordsize;
    
    for(i = 0; i < fullWords; i++) {
        unsigned long word = *(bitmap.begin()._M_p + i);
        bitmapwordRank += __builtin_popcountl(word);
    }
    unsigned long word = *(bitmap.begin()._M_p + i);
    unsigned long shift = (pos % wordsize);
    unsigned long mask = (1UL << shift)-1;
    
    unsigned long maskedWord = word & mask;
    bitmapwordRank += __builtin_popcountl(maskedWord);
    return bitmapwordRank;
}


int Node::select(int character, unsigned long occurance) {
    bool charBit = this == parent->right;
    return parent->parentSelect(charBit, occurance);
}

int Node::parentSelect(bool charBit, unsigned long occurance) {
    if(parent == nullptr) {
        //we are root
        return binarySelect(charBit, occurance);
    }
    int position = binarySelect(charBit, occurance);
    
    bool parentCharBit = this == parent->right;
    return parent->parentSelect(parentCharBit, position+1);
}

int Node::binarySelect(bool charBit, unsigned long occurance) {
    unsigned long occ = 0;
    for(unsigned long i = 0; i < bitmap.size(); i++) {
        if(bitmap[i] == charBit) { 
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
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }

    return leaf;
}
