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
    
    int bitmapSize = (int) ceil(amount * log2(alphabetSize));
    bitmap = new boost::dynamic_bitset<>(bitmapSize,0);
//    cout << bitmapSize << endl;
    int bitmapOffset = 0;
    
    new (root) Node(input, 0, alphabetSize, root, bitmap, bitmapOffset);
    
    
}