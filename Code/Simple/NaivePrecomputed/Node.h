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
//#define NDEBUG
#include <assert.h>

typedef std::vector<bool> bitmap_t;
typedef std::vector<uint> blockRanksVector;

using namespace std;

class Node {
private:
    bitmap_t* bitmap;
    blockRanksVector blockRanks;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode, uint blockSize);
    uint rank(uint character, uint index, uint alphabetMin, uint alphabetMax, uint blockSize);
    uint blockBinaryRank(uint pos, uint blockSize);
    ulong popcountBinaryRank(uint offset, uint pos);
//    ulong binaryRank(ulong index);
    uint binaryRank(uint offset, uint length);
    uint select(bool charBit, ulong occurance);
    uint binarySelect(bool charBit, ulong occurance);
    ulong popcountBinarySelect(bool charBit, ulong occurance);
    Node* getLeaf(uint character, uint alphabetMin, uint alphabetMax);
    uint leafSelect(uint character, ulong occurance);
};



#endif	/* NODE_H */

