/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>


using namespace std;


Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, float skew) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    
    double dSkew = (double) skew;
    ulong bitmapSize = amount * log2((double)2*alphabetSize + 1) / log2(1.0/(1.0-(1.0/dSkew)));
    
    long pageSize = sysconf(_SC_PAGESIZE);
    uint pages = bitmapSize/pageSize;
    pageRanks = vector<uint>(pages, 0);

    bitmap = new bitmap_t(bitmapSize);
    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, skew, pageRanks, pageSize);
    
    // Shrink vectors to fit
    bitmap->resize(bitmapOffset);
    bitmap->shrink_to_fit();
    pageRanks.resize(bitmapOffset/pageSize);
    pageRanks.shrink_to_fit();
}

int Tree::rank(int character, unsigned long index, float skew) {
    if(index > inputSize) index = inputSize;
    long pageSize = sysconf(_SC_PAGESIZE);
    return root->rank(character, index, bitmap, alphabetMin, alphabetMax, skew, pageRanks, pageSize);
}

int Tree::select(int character, unsigned long occurance, float skew) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
    long pageSize = sysconf(_SC_PAGESIZE);
    return leaf->leafSelect(character, occurance, bitmap, pageRanks, pageSize);
}
