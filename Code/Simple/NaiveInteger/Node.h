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
    Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode, uint skew);
    int rank(int character, unsigned long index, int alphabetMin, int alphabetMax, uint skew);
    unsigned long int popcountBinaryRank(unsigned long pos);
    ulong binaryRank(ulong index);
    uint select(bool charBit, unsigned long occurance);
    uint binarySelect(bool charBit, unsigned long occurance);
    ulong popcountBinarySelect(bool charBit, unsigned long occurance);
    Node* getLeaf(uint character, uint alphabetMin, uint alphabetMax, uint skew);
    uint leafSelect(uint character, unsigned long occurance);
};

#endif	/* NODE_H */

