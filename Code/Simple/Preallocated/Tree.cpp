/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>


using namespace std;


Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint skew) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    
    double dSkew = (double) skew;
//    unsigned long bitmapSize = amount * log2(alphabetSize) / log2(dSkew/(dSkew-1));
    ulong bitmapSize = amount * log2((double)2*alphabetSize + 1) / log2(1.0/(1.0-(1.0/dSkew)));

    bitmap = new bitmap_t(bitmapSize);
//    cout << bitmapSize << endl;
    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, skew);
    bitmap->resize(bitmapOffset);
}

int Tree::rank(int character, unsigned long index, uint skew) {
    if(index > inputSize) index = inputSize;
    return root->rank(character, index, bitmap, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance, bitmap);
}
