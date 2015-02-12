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

Node::Node(vector<int> input, int alphabetMin, int alphabetMax, Node* &node_pt, _Bit_iterator &bitmap_it): isLeaf(false) {
    if(input.size() == 0) {
//        cout << "Empty Node" << endl;
        return;
    }
    
    int alphabetSize = alphabetMax - alphabetMin;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << input[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    bitmap_start = bitmap_it; //remember this node's bitmap position in larger bitmap
    bitmap_size = input.size(); //one bit for each character in the input string
   
    int split = (alphabetSize / 4) + alphabetMin;
    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split;
    int rightAlphabetMax = alphabetMax;
    
    vector<int> leftString;
    vector<int> rightString;
    
    for(auto it = input.begin(); it != input.end(); it++) {
        int currentChar = *it;
        if(currentChar < split) {
            (*bitmap_it) = false;
            leftString.push_back(currentChar);
        } else {
            (*bitmap_it) = true;
            rightString.push_back(currentChar);
        }
        bitmap_it++;
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
    
    right = node_pt; //store pointer to right node
    //construct node, save it at right pointer location. give it incremented node_pt and bitmap_it so they point to free space.
    *right = Node(rightString, rightAlphabetMin, rightAlphabetMax, ++node_pt, ++bitmap_it);
    //same for left. node_pt and bitmap_it should have been incrememented by our right subnode to point to free space now.
    left = node_pt;
    *left = Node(leftString, leftAlphabetMin, leftAlphabetMax, ++node_pt, ++bitmap_it);
}
