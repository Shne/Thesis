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


Node::Node(vector<int> input, int alphabetMin, int alphabetMax): isLeaf(false), left(NULL), right(NULL) {
    //alphabetMax is really max + 1, so compare with <, not <=
    int alphabetSize = alphabetMax - alphabetMin;
//    cout << "AS: " << alphabetSize << endl;
//    cout << "IS: " << input.size() << endl;
//    cout << input[0] << endl;
    if(input.size() == 0) {
        cout << "Empty Node" << endl;
        return;
    }
    
    if(alphabetSize == 1) {
//        string str(input.begin(), input.end());
        cout << "LEAF:\t\t" << input[0] << endl;
        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
   
    int split = (alphabetSize / 2) + alphabetMin;
//    cout << "SPLIT: " << split << endl;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split;
    int rightAlphabetMax = alphabetMax;
    
    vector<int> leftString;
    vector<int> rightString;
    
//    cout << "START" << endl;
    for(auto it = input.begin(); it != input.end(); it++) {
        int currentChar = *it;
//        cout << "currentChar: " << currentChar << endl;
        if(currentChar < split) {
//            cout << "  LEFT" << endl;
            bitmap.push_back(false);
            leftString.push_back(currentChar);
        } else {
//            cout << "  RIGHT" << endl;
            bitmap.push_back(true);
            rightString.push_back(currentChar);
        }
    }
//    cout << "END" << endl;
    
    
//    string str(input.begin(), input.end());
//    string leftstr(leftString.begin(), leftString.end());
//    string rightstr(rightString.begin(), rightString.end());
//    cout << "string:\t\t" << str << endl;
//    cout << "split char:\t" << split << endl;
//    cout << "left alphabet:\t[" << leftAlphabetMin << ", " << leftAlphabetMax << "]" << endl;
//    cout << "right alphabet:\t[" << rightAlphabetMin << ", " << rightAlphabetMax << "]" << endl;
//    cout << "left string:\t" << leftstr << endl;
//    cout << "right string:\t" << rightstr << endl;
//    cout << "---------------" << endl;
    
    left = new Node(leftString, leftAlphabetMin, leftAlphabetMax);
    right = new Node(rightString, rightAlphabetMin, rightAlphabetMax);
}

void Node::printAlphabet(const char* alphabet, int alphabetSize) {
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}
