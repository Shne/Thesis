/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

//#define SKEW 2

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
#define NDEBUG
#include <assert.h>

typedef std::vector<bool> bitmap_t;

using namespace std;

class Node {
private:
    ulong bitmapOffset;
    ulong bitmapSize;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<unsigned int>* input, unsigned int alphabetMin, unsigned int alphabetMax, Node* parentNode,
        Node* &node_pt, bitmap_t* in_bitmap, unsigned long &in_bitmapOffset, float skew);
    uint rank(int character, unsigned long index, bitmap_t* bitmap, int alphabetMin, int alphabetMax, float skew);
    ulong popcountBinaryRank(unsigned long pos, bitmap_t* bitmap);
    ulong binaryRank(vector<bool>::reference ref, ulong length);
    uint select(int character, bool charBit, unsigned long occurance, bitmap_t* bitmap);
    uint binarySelect(bool charBit, unsigned long occurance, bitmap_t* bitmap);
    uint popcountBinarySelect(bool charBit, unsigned long occurance, bitmap_t* bitmap);
    Node* getLeaf(int character, int alphabetMin, int alphabetMax, float skew);
    uint leafSelect(int character, unsigned long occurance, bitmap_t* bitmap);
    
    inline void showBits(unsigned long n);
};

#endif	/* NODE_H */

