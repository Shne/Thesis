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


Node::Node(vector<char> s, const char* alphabet, int alphabetSize): isLeaf(false), left(NULL), right(NULL) {
    
    if(alphabetSize == 1) {
#ifdef DEBUG
        string str(s.begin(), s.end());
        cout << "LEAF:\t\t" << str << endl;
        cout << "---------------" << endl;
#endif
        isLeaf = true;
        return;
    }
    char split = alphabet[((alphabetSize+1)/2)-1]; //looks weird but handles the computation correctly for both even and odd cases
    int rightAlphabetSize = alphabetSize/2;
    int leftAlphabetSize = alphabetSize - rightAlphabetSize;
    const char* leftAlphabet = alphabet;
    const char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    
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
    
#ifdef DEBUG
    string str(s.begin(), s.end());
    string leftstr(leftString.begin(), leftString.end());
    string rightstr(rightString.begin(), rightString.end());
    cout << "string:\t\t" << str << endl;
    cout << "split char:\t" << split << endl;
    cout << "left alphabet:\t"; printAlphabet(leftAlphabet, leftAlphabetSize);
    cout << "right alphabet:\t"; printAlphabet(rightAlphabet, rightAlphabetSize);
    cout << "left string:\t" << leftstr << endl;
    cout << "right string:\t" << rightstr << endl;
    cout << "---------------" << endl;
#endif
    
    left = new Node(leftString, leftAlphabet, leftAlphabetSize);
    right = new Node(rightString, rightAlphabet, rightAlphabetSize);
}

void Node::printAlphabet(const char* alphabet, int alphabetSize) {
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}
