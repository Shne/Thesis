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
    bitmap_t bitmap;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public: 
    Node();
    Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode, uint skew);
    int rank(uint character, ulong index, uint alphabetMin, uint alphabetMax, uint skew);
    ulong popcountBinaryRank(ulong pos);
    ulong binaryRank(ulong index);
    uint select(bool charBit, ulong occurance);
    uint binarySelect(bool charBit, ulong occurance);
    ulong popcountBinarySelect(bool charBit, ulong occurance);
    Node* getLeaf(uint character, uint alphabetMin, uint alphabetMax, uint skew);
    uint leafSelect(uint character, ulong occurance);
};

#endif	/* NODE_H */

