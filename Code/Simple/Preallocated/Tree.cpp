/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<int> input, int amount, int alphabetSize) {
    auto nodeArraySize = sizeof(Node[2*alphabetSize-1]);
    Node* nodeArray = static_cast<Node*> (::operator new (nodeArraySize));
    
    int bitmapSize = (int) ceil(amount * log2(alphabetSize));
    vector<bool> bitmap = vector<bool>();
    bitmap.reserve(bitmapSize);
    auto bitmap_it = bitmap.begin();
    
    nodeArray[0] = Node(input, 0, alphabetSize, (++nodeArray), bitmap_it);
}