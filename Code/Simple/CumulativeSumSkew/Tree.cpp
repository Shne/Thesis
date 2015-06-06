/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint blockSize, float skew)
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount), blockSize(blockSize),
        skew(skew), root(Node(input, 0, alphabetSize-1, nullptr, blockSize, skew))
{
}

int Tree::rank(uint character, ulong index) {
    if(index > inputSize) index = inputSize;
    return root.rank(character, index, alphabetMin, alphabetMax, blockSize, skew);
}

int Tree::select(uint character, ulong occurrence) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurrence, blockSize);
}