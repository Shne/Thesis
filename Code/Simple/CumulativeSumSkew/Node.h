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
#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <papi.h>
#include <unistd.h>
#define NDEBUG
#include <assert.h>

//#define BRANCHLESSSELECT

typedef std::vector<bool> bitmap_t;
typedef std::vector<uint> blockRanksVector;

using namespace std;

class Node {
private:
    bitmap_t bitmap;
    blockRanksVector blockRanks;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode, uint blockSize, Node* &node_pt, float skew);
    uint rank(uint character, uint index, uint alphabetMin, uint alphabetMax, uint blockSize, float skew);
    uint blockBinaryRank(uint pos, uint blockSize);
    ulong popcountBinaryRank(uint offset, uint pos);
    uint binaryRank(vector<bool>::reference ref, uint length);
    Node* getLeaf(uint character, uint alphabetMin, uint alphabetMax, float skew);
    uint leafSelect(uint character, ulong occurrence, uint blockSize);
    uint select(bool charBit, ulong occurrence, uint blockSize);
    uint blockBinarySelect(bool charBit, uint occurrence, uint blockSize);
    uint popcountBinarySelect(bool charBit, uint occurrence, uint offset);
    uint binarySelect(bool charBit, ulong occurrence);
};



#endif	/* NODE_H */

