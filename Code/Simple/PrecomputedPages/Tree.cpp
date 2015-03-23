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
    long pageSize = sysconf(_SC_PAGESIZE) * CHAR_BIT; //sysconf returns pagesize in bytes, we want it in bits
    uint blockSize = pageSize;
//    cout << pageSize << " " << pageSize * CHAR_BIT << endl;
    uint blocks = bitmapSize/blockSize;
    blockRanks = vector<ushort>(blocks, 0);

    bitmap = new bitmap_t(bitmapSize);
    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, skew, blockRanks, blockSize);
    
    // Shrink vectors to fit
    bitmap->resize(bitmapOffset);
    bitmap->shrink_to_fit();
    blockRanks.resize(bitmapOffset/blockSize);
    blockRanks.shrink_to_fit();
}

int Tree::rank(int character, unsigned long index, float skew) {
    if(index > inputSize) index = inputSize;
    long pageSize = sysconf(_SC_PAGESIZE)*CHAR_BIT;
    return root->rank(character, index, bitmap, alphabetMin, alphabetMax, skew, blockRanks, pageSize);
}

int Tree::select(int character, unsigned long occurance, float skew) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
    long pageSize = sysconf(_SC_PAGESIZE)*CHAR_BIT;
    return leaf->leafSelect(character, occurance, bitmap, blockRanks, pageSize);
}
