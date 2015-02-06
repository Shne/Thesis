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


Node::Node(char* stringBegin, char* stringEnd, const char* alphabet, int alphabetSize): isLeaf(false), left(NULL), right(NULL) {
    
    if(alphabetSize == 1) {
        string str(stringBegin, stringEnd);
        cout << "LEAF:\t\t" << str << endl;
        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    
    char split = alphabet[((alphabetSize+1)/2)-1]; //looks weird but handles the computation correctly for both even and odd cases
    int rightAlphabetSize = alphabetSize/2;
    int leftAlphabetSize = alphabetSize - rightAlphabetSize;
    const char* leftAlphabet = alphabet;
    const char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    
    int stringSize = stringEnd-stringBegin;
    char* newString = new char[stringSize];
    
    char* leftString = newString;
    char* rightString = &newString[stringSize];
    
    bitmap = new bool[stringSize];
    int i = 0;
    
    for(auto it = stringBegin; it != stringEnd; it++) {
        
        char currentChar = *it;
        if(currentChar <= split) {
            bitmap[i++] = true;
            *leftString = currentChar;
            leftString++;
        } else {
            bitmap[i++] = false;
            *rightString = currentChar;
            rightString--;
        }
    }
    
    string str(stringBegin, stringEnd);
    string leftstr(stringBegin, leftString);
    string rightstr(rightString, stringEnd);
    cout << "string:\t\t" << str << endl;
    cout << "split char:\t" << split << endl;
    cout << "left alphabet:\t"; printAlphabet(leftAlphabet, leftAlphabetSize);
    cout << "right alphabet:\t"; printAlphabet(rightAlphabet, rightAlphabetSize);
    cout << "left string:\t" << leftstr << endl;
    cout << "right string:\t" << rightstr << endl;
    cout << "---------------" << endl;
    
    left = new Node(stringBegin, leftString, leftAlphabet, leftAlphabetSize);
    right = new Node(rightString, stringEnd, rightAlphabet, rightAlphabetSize);
}

void Node::printAlphabet(const char* alphabet, int alphabetSize) {
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}
