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

Node::Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* node_pt, boost::dynamic_bitset<>* in_bitmap, int &in_bitmapOffset): isLeaf(false), left(nullptr), right(nullptr) {
    node_pt++;
//    if(input.size() == 0) {
//        cout << "Empty Node" << endl;
//        return;
//    }
    
    int alphabetSize = alphabetMax - alphabetMin;
    if(alphabetSize == 1) {
//        cout << "LEAF:\t\t" << (*input)[0] << endl;
//        cout << "---------------" << endl;
        isLeaf = true;
        return;
    }
    
    bitmap = in_bitmap;
    bitmapSize = input->size(); //one bit for each character in the input string
    bitmapOffset = in_bitmapOffset;
   
//    int skew = 4;
//    int split;
//    if(alphabetSize > skew) {
//        split = (alphabetSize/skew) + alphabetMin;
//    } else {
//        split = (alphabetSize/2) + alphabetMin;
//    }
    
    int split = (alphabetSize/2) + alphabetMin;

    int leftAlphabetMin = alphabetMin;
    int leftAlphabetMax = split;
    int rightAlphabetMin = split;
    int rightAlphabetMax = alphabetMax;
//    cout << in_bitmapOffset << endl;
    vector<int>* leftString = new vector<int>();
    vector<int>* rightString = new vector<int>();
//    cout << input->size() << endl;
    for(auto it = input->begin(); it != input->end(); it++) {
        int currentChar = *it;
        if(currentChar < split) {
            (*in_bitmap)[in_bitmapOffset] = false;
            leftString->push_back(currentChar);
        } else {
            (*in_bitmap)[in_bitmapOffset] = true;
            rightString->push_back(currentChar);
        }
        in_bitmapOffset++;
    }
//    cout << leftString->size() << endl;
//    cout << rightString->size() << endl;
    

    
//    cout << in_bitmapOffset << endl;
    
    
    
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
    
    
    if(rightString->size() == 0 || leftString->size() == 0) {
        //then kinda ignore us; reset bitmap offset
        in_bitmapOffset = bitmapOffset;
        bitmap = nullptr;
    }
    
    //construct node, save it at right pointer location. give it incremented node_pt and bitmap_it so they point to free space.
    if(rightString->size() != 0) {
        right = node_pt; //store pointer to right node
        new (node_pt) Node(rightString, rightAlphabetMin, rightAlphabetMax, node_pt, in_bitmap, in_bitmapOffset);
    } else {
        delete rightString;
    }
    //same for left. node_pt and bitmap_it should have been incrememented by our right subnode to point to free space now.
    if(leftString->size() != 0) {
        left = node_pt;
        new (node_pt) Node(leftString, leftAlphabetMin, leftAlphabetMax, node_pt, in_bitmap, in_bitmapOffset);
    } else {
        delete leftString;
    }
}
