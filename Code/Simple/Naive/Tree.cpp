/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <iostream>

using namespace std;

Tree::Tree(vector<char> s, const char* alphabet, int alphabetSize) : root(Node(s, alphabet, alphabetSize))
{
}

Node Tree::getRoot(){
    return root;
}

int Tree::rank(char& character, int& index, Node* node, const char*& alphabet, int& alphabetSize){
    if(node->isLeaf){
        return index;
    }
    std::vector<bool> bitmap = node->getBitmap();
    cout << "bitmap=";
    for(auto it = bitmap.begin(); it != bitmap.end(); it++) {
        cout << *it;
    }
    cout << endl;
    
    
    char split = alphabet[((alphabetSize+1)/2)-1]; //looks weird but handles the computation correctly for both even and odd cases
    bool charBit = character > split;
    int pos = binaryRank(charBit, index, bitmap);
    cout << "pos: " << pos << endl;

    
    int rightAlphabetSize = alphabetSize/2;
    int leftAlphabetSize = alphabetSize - rightAlphabetSize;
    const char* leftAlphabet = alphabet;
    const char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    int theRank = 0;
    if(charBit && node->getRightNode() != nullptr){
        cout << "entered right" << endl;
        theRank = rank(character, pos, node->getRightNode(), rightAlphabet, rightAlphabetSize); //right sub tree
    }else if(!charBit && node->getLeftNode() != nullptr){
        cout << "entered left" << endl;
        theRank = rank(character, pos, node->getLeftNode(), leftAlphabet, leftAlphabetSize); //right sub tree
    }
    
    return theRank;
}

//complexity is O(n). this can be improved!
int Tree::binaryRank(bool charBit, int index, std::vector<bool> bitmap){
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

void Tree::printAlphabet(const char* alphabet, int alphabetSize) {
    cout << "alphabet=";
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}