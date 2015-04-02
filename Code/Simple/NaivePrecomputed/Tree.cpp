/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize)
    : alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount), root(Node(input, 0, alphabetSize-1, nullptr))
{
}

int Tree::rank(uint character, ulong index) {
    if(index > inputSize) index = inputSize;
    return root.rank(character, index, alphabetMin, alphabetMax);
}

int Tree::select(uint character, ulong occurance) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax);
    return leaf->leafSelect(character, occurance);
}