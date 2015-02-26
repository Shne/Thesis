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

typedef std::vector<bool> bitmap_t;

using namespace std;

class Node {
private:
    bitmap_t* bitmap;
    unsigned long bitmapOffset;
    unsigned long bitmapSize;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<unsigned int>* input, unsigned int alphabetMin, unsigned int alphabetMax, Node* parentNode,
        Node* &node_pt, bitmap_t* in_bitmap, unsigned long &in_bitmapOffset, uint skew);
    int rank(int character, unsigned long index, int alphabetMin, int alphabetMax, uint skew);
    unsigned long int popcountBinaryRank(unsigned long pos);
    ulong binaryRank(ulong index);
    int select(int character, bool charBit, unsigned long occurance);
    int binarySelect(bool charBit, unsigned long occurance);
    int popcountBinarySelect(bool charBit, unsigned long occurance);
    Node* getLeaf(int character, int alphabetMin, int alphabetMax, uint skew);
    int leafSelect(int character, unsigned long occurance);
    
    inline void showBits(unsigned long n);
};

#endif	/* NODE_H */

