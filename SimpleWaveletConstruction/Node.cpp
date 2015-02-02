/* 
 * File:   Node.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */ 

#include "Node.h"

using namespace std;


Node::Node(vector<char> s, char* alphabet, int alphabetSize) {
    if(alphabetSize == 1) {
        isLeaf = true;
        leafChar = alphabet[0];
        return;
    }
    char split = alphabet[alphabetSize/2];
    char* leftAlphabet = alphabet;
    int leftAlphabetSize = alphabetSize/2;
    char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    int rightAlphabetSize = alphabetSize - leftAlphabetSize;

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
    left = new Node(leftString, leftAlphabet, leftAlphabetSize);
    right = new Node(rightString, rightAlphabet, rightAlphabetSize);
}
