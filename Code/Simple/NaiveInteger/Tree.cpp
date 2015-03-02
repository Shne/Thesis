/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint skew)
    : root(Node(input, 0, alphabetSize-1, nullptr, skew)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
{
}

int Tree::rank(uint character, ulong index, uint skew) {
    if(index > inputSize) index = inputSize;
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(uint character, ulong occurance, uint skew) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
}