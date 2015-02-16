/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<int>* input, int amount, int alphabetSize) {
//    auto nodeArraySize = ;
    root = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    
//    int bitmapSize = (int) amount * log2(alphabetSize) * 1.2;
    
    double skew = (double) SKEW;
    long bitmapSize = (int) amount * log2(alphabetSize) / log2(skew/(skew-1));
    
//    bitmap = new boost::dynamic_bitset<>(bitmapSize,0);
    bitmap = new bitmap_t(bitmapSize);
//    cout << bitmapSize << endl;
    long bitmapOffset = 0;
    
    new (root) Node(input, 0, alphabetSize-1, root, bitmap, bitmapOffset);
    
    
}