/* 
 * File:   Node.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */ 

#include "Node.h"
#include <iostream>
#include <cmath>

using namespace std;

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode)
    : isLeaf(false), left(NULL), right(NULL), parent(parentNode) {
    if(input->size() == 0) {
//        cout << "Empty Node" << endl;
//        cout << "---------------" << endl;
        return;
    }
    
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
        if(currentChar < split) {
            bitmap.push_back(false);
            leftString->push_back(currentChar);
        } else {
            bitmap.push_back(true);
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
    
    left = new Node(leftString, leftAlphabetMin, leftAlphabetMax, this);
    right = new Node(rightString, rightAlphabetMin, rightAlphabetMax, this);
}



int Node::rank(int character, int index, int alphabetMin, int alphabetMax){
    if(isLeaf){ 
        return index;
    }
    
    int alphabetSize = alphabetMax - alphabetMin +1;
    int split = (alphabetSize-1)/SKEW + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    bool charBit = character >= split;
    int pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
    cout << "binary rank; " << pos << endl;
    
    int rank = 0;
    if(charBit && right != nullptr) {
        rank = right->rank(character, pos, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
        rank = left->rank(character, pos, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }
    
    return rank;
}

unsigned int Node::binaryRankPopcountInstruction(unsigned int pos) {
    if(pos > bitmap.size()) return -1;
    unsigned int bitmapwordRank = 0;
    
    unsigned long i;
    cout << sizeof(long unsigned int) << " should be 64" << endl;
    unsigned int wordsize = sizeof(long unsigned int);
    
    for(i = 0; i+wordsize < pos; i+=wordsize) {
        long unsigned int* word((bitmap.begin()+i)._M_p);
        bitmapwordRank += __builtin_popcountl(*word); //this cast might not work
    }
    
    unsigned int word((unsigned int) *(bitmap.begin()+i)._M_p);
    unsigned int mask = (1 << pos) -1;
    word &= mask;
    bitmapwordRank += __builtin_popcount(word);
    return bitmapwordRank;
}


int Node::select(int character, int index) {
    if(parent == nullptr) {
        return index;
    }
    
    bool charBit = this == parent->left;
    int pos = isLeaf ? index : binarySelect(charBit, index);
    
    return parent->select(character, pos);
}

int Node::binarySelect(bool charBit, int index) {
    int pos = 0;
    for(int i = 0; i < bitmap.size(); i++) {
        if(i+1 > index) break;

        if(bitmap[i] == charBit) { 
            pos += i+1;
        }
    }
    
    return pos;
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
    
    bool charBit = character >= split;
    
    Node* leaf = nullptr;
    if(charBit && right != nullptr){
        leaf = right->getLeaf(character, rightAlphabetMin, rightAlphabetMax); //right sub tree
    }else if(left != nullptr){
        leaf = left->getLeaf(character, leftAlphabetMin, leftAlphabetMax); //right sub tree
    }
    
    return leaf;
}
