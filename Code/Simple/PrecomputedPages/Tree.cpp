/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>


using namespace std;


Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    
    ulong maxBitmapSize = amount * log2((double)2*alphabetSize + 1);
    long pageSize = sysconf(_SC_PAGESIZE) * CHAR_BIT; //sysconf returns pagesize in bytes, we want it in bits
    uint blockSize = pageSize;
    uint maxBlocks = maxBitmapSize/blockSize;
    blockRanks = vector<ushort>(maxBlocks, 0);

    bitmap = new bitmap_t(maxBitmapSize);

    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, blockRanks, blockSize);
    // Shrink vectors to fit
//    bitmap->resize(bitmapOffset);
//    bitmap->shrink_to_fit();
    blockRanks.resize(bitmapOffset/blockSize +1); //+1 to keep last non-full block
    blockRanks.shrink_to_fit();
}

int Tree::rank(int character, unsigned long index) {
    if(index > inputSize) index = inputSize;
    long pageSize = sysconf(_SC_PAGESIZE)*CHAR_BIT;
    return root->rank(character, index, bitmap, alphabetMin, alphabetMax, blockRanks, pageSize);
}

int Tree::select(int character, unsigned long occurance) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax);
    long pageSize = sysconf(_SC_PAGESIZE)*CHAR_BIT;
    return leaf->leafSelect(character, occurance, bitmap, blockRanks, pageSize);
}
