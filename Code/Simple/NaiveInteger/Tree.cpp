/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint skew)
    : alphabetMin(0), alphabetMax(alphabetSize-1),
        inputSize(amount)
#ifndef NODEARRAY
    , root(Node(input, 0, alphabetSize-1, nullptr, skew))
#endif
{
    
#ifdef NODEARRAY
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, skew);
#endif
}

int Tree::rank(uint character, ulong index, uint skew) {
    if(index > inputSize) index = inputSize;
#ifdef NODEARRAY
    return root->rank(character, index, alphabetMin, alphabetMax, skew);
#else
    return root.rank(character, index, alphabetMin, alphabetMax, skew);
#endif
}

int Tree::select(uint character, ulong occurance, uint skew) {
#ifdef NODEARRAY
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
#else
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax, skew);
#endif
    return leaf->leafSelect(character, occurance);
}