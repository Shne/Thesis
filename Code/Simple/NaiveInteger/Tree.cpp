/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize)
    : root(Node(input, 0, alphabetSize-1, nullptr)),
        alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
{
}

int Tree::rank(int character, unsigned long index) {
    if(index >= inputSize) index = inputSize -1;
    return root.rank(character, index, alphabetMin, alphabetMax);
}

int Tree::select(int character, unsigned long index) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax);
    return leaf->select(character, index);
}