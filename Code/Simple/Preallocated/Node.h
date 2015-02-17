/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#define SKEW 2

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
//#include <boost/dynamic_bitset.hpp>

typedef std::vector<bool> bitmap_t;

using namespace std;

class Node {
private:
    bitmap_t* bitmap;
    int bitmapOffset;
    int bitmapSize;
    bool isLeaf;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* node_pt, bitmap_t* in_bitmap, long &in_bitmapOffset);
};

#endif	/* NODE_H */
