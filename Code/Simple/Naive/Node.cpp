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


Node::Node(vector<char> s, const char* alphabet, int alphabetSize, Node* parentNode): isLeaf(false), left(NULL), right(NULL), parent(NULL) {
    parent = parentNode;
    if(alphabetSize == 1) {
//        string str(s.begin(), s.end());
//        cout << "LEAF:\t\t" << str << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    char split;
    int rightAlphabetSize;
    int leftAlphabetSize;
    const char* leftAlphabet;
    const char* rightAlphabet;    
    calculateSplitAndAlphabet(split, rightAlphabetSize, leftAlphabetSize, rightAlphabet, leftAlphabet, alphabet, alphabetSize);
    
    vector<char> leftString;
    vector<char> rightString;
    for(auto it = s.begin(); it != s.end(); it++) {
        char currentChar = *it;
        if(currentChar <= split) {
            bitmap.push_back(false);
            leftString.push_back(currentChar);
        } else {
            bitmap.push_back(true);
            rightString.push_back(currentChar);
        }
    }
    
//    string str(s.begin(), s.end());
//    string leftstr(leftString.begin(), leftString.end());
//    string rightstr(rightString.begin(), rightString.end());
//    cout << "string:\t\t" << str << endl;
//    cout << "split char:\t" << split << endl;
//    cout << "left alphabet:\t"; printAlphabet(leftAlphabet, leftAlphabetSize);
//    cout << "right alphabet:\t"; printAlphabet(rightAlphabet, rightAlphabetSize);
//    cout << "left string:\t" << leftstr << endl;
//    cout << "right string:\t" << rightstr << endl;
//    cout << "---------------" << endl;
    
    
    left = new Node(leftString, leftAlphabet, leftAlphabetSize, this);
    right = new Node(rightString, rightAlphabet, rightAlphabetSize, this);
    
}

void Node::printAlphabet(const char* alphabet, int alphabetSize) {
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}

std::vector<bool> Node::getBitmap(){
    return bitmap;
}

Node* Node::getLeftNode(){
    return left;
}

Node* Node::getRightNode(){
    return right;
}

Node* Node::getParentNode(){
    return parent;
}

Node* Node::getLeaf(char character, const char* alphabet, int alphabetSize){ 
    if(isLeaf){        
        return this;
    }
    
    char split;
    int rightAlphabetSize;
    int leftAlphabetSize;
    const char* leftAlphabet;
    const char* rightAlphabet;    
    calculateSplitAndAlphabet(split, rightAlphabetSize, leftAlphabetSize, rightAlphabet, leftAlphabet, alphabet, alphabetSize);
    
    bool charBit = character > split;
    
    Node* theRank = nullptr;
    if(charBit && right != nullptr){
        theRank = right->getLeaf(character, rightAlphabet, rightAlphabetSize); //right sub tree
    }else if(!charBit && left != nullptr){
        theRank = left->getLeaf(character, leftAlphabet, leftAlphabetSize); //right sub tree
    }
    
    return theRank;
}

int Node::rank(char character, int index, const char* alphabet, int alphabetSize){
    if(isLeaf){ 
        return index;
    }
    
    char split;
    int rightAlphabetSize;
    int leftAlphabetSize;
    const char* leftAlphabet;
    const char* rightAlphabet;    
    calculateSplitAndAlphabet(split, rightAlphabetSize, leftAlphabetSize, rightAlphabet, leftAlphabet, alphabet, alphabetSize);
        
    bool charBit = character > split;
//    int pos = binaryRank(charBit, index);
    int pos = charBit ? binaryRankPopcountInstruction(index) : index - binaryRankPopcountInstruction(index);
    cout << "binary rank; " << pos << endl;
    
    int theRank = 0;
    if(charBit && right != nullptr){
        theRank = right->rank(character, pos, rightAlphabet, rightAlphabetSize); //right sub tree
    }else if(!charBit && left != nullptr){
        theRank = left->rank(character, pos, leftAlphabet, leftAlphabetSize); //right sub tree
    }
    
    return theRank;
}


int Node::select(char character, int index){
    if(parent == nullptr){ 
        return index;
    }        
    
    bool charBit = this == parent->left;
    int pos = isLeaf ? index : binarySelect(charBit, index);
    
    return parent->select(character, pos); 
}

int Node::binaryRank(bool charBit, int index){
    int i = 1;
    int rank = 0;
    for(auto it = bitmap.begin(); it != bitmap.end(); it++) {
        if(i > index) break;
        
        char currentBit = *it;
        if(currentBit == charBit) { 
            rank++;
        }
        i++;        
    }
    
    return rank;
}

unsigned int Node::binaryRankPopcountInstruction(unsigned int pos){
    if(pos > bitmap.size()) return -1;
    unsigned int bitmapwordRank = 0;
    
    unsigned long i;
    unsigned int wordsize = 64;
    
    for(i = 0; i+wordsize < pos; i+=wordsize){
//        vector<bool> wordVector(bitmap.begin()+i, bitmap.begin() + i + 64);
//        auto word = wordVector.begin()._M_p;
        long unsigned int* word((bitmap.begin()+i)._M_p);
        bitmapwordRank += __builtin_popcount((unsigned int)*word); //this cast might not work
    }
    
    unsigned int word((unsigned int) *(bitmap.begin()+i)._M_p);
    unsigned int mask = (1 << pos) -1;
    word &= mask;
    bitmapwordRank += __builtin_popcount(word);
    return bitmapwordRank;
}

//From https://graphics.stanford.edu/~seander/bithacks.html#CountBitsFromMSBToPos
uint64_t Node::binaryRankPopcount(uint64_t bitset, unsigned int position){
    uint64_t v = bitset;       // Compute the rank (bits set) in v from the MSB to pos.
    unsigned int pos = position; // Bit position to count bits upto.
    uint64_t r;       // Resulting rank of bit at pos goes here.

    // Shift out bits after given position. CHAR_BIT is number of bits in a byte (usually 8)
    r = v >> (sizeof(v) * CHAR_BIT - pos);
    // Count set bits in parallel.
    // r = (r & 0x5555...) + ((r >> 1) & 0x5555...);
    r = r - ((r >> 1) & ~0UL/3);
    // r = (r & 0x3333...) + ((r >> 2) & 0x3333...);
    r = (r & ~0UL/5) + ((r >> 2) & ~0UL/5);
    // r = (r & 0x0f0f...) + ((r >> 4) & 0x0f0f...);
    r = (r + (r >> 4)) & ~0UL/17;
    // r = r % 255;
    r = (r * (~0UL/255)) >> ((sizeof(v) - 1) * CHAR_BIT);
    return r;
}

int Node::binarySelect(bool charBit, int index){
    int i = 1;
    int pos = 0;
    for(auto it = bitmap.begin(); it != bitmap.end(); it++) {
        if(i > index) break;
        
        char currentBit = *it;
        if(currentBit == charBit) { 
            pos += i;
        }
        i++;        
    }
    
    return pos;
}

inline void Node::calculateSplitAndAlphabet(char& split, int& rightAlphabetSize, int& leftAlphabetSize, 
        const char*& rightAlphabet, const char*& leftAlphabet, const char* alphabet, int alphabetSize){
    split = alphabet[((alphabetSize+1)/2)-1]; //looks weird but handles the computation correctly for both even and odd cases
    rightAlphabetSize = alphabetSize/2;
    leftAlphabetSize = alphabetSize - rightAlphabetSize;
    leftAlphabet = alphabet;
    rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
}