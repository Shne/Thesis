/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>

using namespace std;

class Node {
private:
    _Bit_iterator bitmap_start;
    int bitmap_size;
    bool isLeaf;
    Node* left;
    Node* right;
public: 
    Node();
    Node(vector<int> input, int alphabetMin, int alphabetMax, Node* &node_pt, _Bit_iterator &bitmap_it);
};

#endif	/* NODE_H */

