/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>


using namespace std;


Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint blockSize) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount), blockSize(blockSize) {
    
    ulong maxBitmapSize = amount * log2(alphabetSize);
    uint maxBlocks = maxBitmapSize/blockSize;
    blockRanks = blockRanksVector(maxBlocks, 0);

    bitmap = new bitmap_t(maxBitmapSize);

    ulong bitmapOffset = 0;
    root = Node(input, (uint)0, alphabetSize-1, nullptr, bitmap, bitmapOffset, blockRanks, blockSize);

//    bitmap->resize(bitmapOffset);
//    bitmap->shrink_to_fit();
//    blockRanks.resize(bitmapOffset/blockSize +1); //+1 to keep last non-full block
//    blockRanks.shrink_to_fit();
}

int Tree::rank(int character, unsigned long index) {
    if(index > inputSize) index = inputSize;
    return root.rank(character, index, bitmap, alphabetMin, alphabetMax, blockRanks, blockSize);
}

int Tree::select(int character, unsigned long occurance) {
    Node* leaf = root.getLeaf(character, alphabetMin, alphabetMax);
    return leaf->leafSelect(character, occurance, bitmap, blockRanks, blockSize);
}
