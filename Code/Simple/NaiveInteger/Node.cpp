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
    int alphabetSize = alphabetMax - alphabetMin +1;
    if(input.size() == 0) {
//        cout << "Empty Node" << endl;
        return;
    }
    
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << input[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
   
    int split = (alphabetSize-1)/SKEW + alphabetMin;

    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split+1;
    int rightAlphabetMax = alphabetMax;
    
    vector<int> leftString;
    vector<int> rightString;
    
    for(auto it = input.begin(); it != input.end(); it++) {
        int currentChar = *it;
        if(currentChar < split) {
            bitmap.push_back(false);
            leftString.push_back(currentChar);
        } else {
            bitmap.push_back(true);
            rightString.push_back(currentChar);
        }
    }
    
//    stringstream str, leftstr, rightstr;
//    copy(input.begin(), input.end(), ostream_iterator<int>(str, " "));
//    copy(leftString.begin(), leftString.end(), ostream_iterator<int>(leftstr, " "));
//    copy(rightString.begin(), rightString.end(), ostream_iterator<int>(rightstr, " "));
//    cout << "string:\t\t" << str.str() << endl;
//    cout << "split char:\t" << split << endl;
//    cout << "left alphabet:\t[" << leftAlphabetMin << ", " << leftAlphabetMax << "]" << endl;
//    cout << "right alphabet:\t[" << rightAlphabetMin << ", " << rightAlphabetMax << "]" << endl;
//    cout << "left string:\t" << leftstr.str() << endl;
//    cout << "right string:\t" << rightstr.str() << endl;
//    cout << "---------------" << endl;
    
    left = new Node(leftString, leftAlphabetMin, leftAlphabetMax);
    right = new Node(rightString, rightAlphabetMin, rightAlphabetMax);
}
