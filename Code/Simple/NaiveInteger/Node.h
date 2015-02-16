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
    Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode);
    int rank(int character, unsigned long int index, int alphabetMin, int alphabetMax);
    unsigned long int binaryRankPopcountInstruction(unsigned long int pos);
    int select(int character, unsigned long int index);
    int binarySelect(bool charBit, unsigned long int index);
    Node* getLeaf(int character, int alphabetMin, int alphabetMax);
};

#endif	/* NODE_H */

