/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
//    auto nodeArraySize = ;
    root = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    
//    int bitmapSize = (int) amount * log2(alphabetSize) * 1.2;
    
    double skew = (double) SKEW;
    long bitmapSize = (int) amount * log2(alphabetSize) / log2(skew/(skew-1));
    
//    bitmap = new boost::dynamic_bitset<>(bitmapSize,0);
    bitmap = new bitmap_t(bitmapSize);
//    cout << bitmapSize << endl;
    long bitmapOffset = 0;
    
    new (root) Node(input, 0, alphabetSize-1, nullptr, root, bitmap, bitmapOffset);
}

int Tree::rank(int character, unsigned long index) {
    if(index > inputSize) index = inputSize;
    return root->rank(character, index, alphabetMin, alphabetMax);
}

int Tree::select(int character, unsigned long occurance) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax);
    return leaf->leafSelect(character, occurance);
}