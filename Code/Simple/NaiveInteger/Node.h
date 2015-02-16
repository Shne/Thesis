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

using namespace std;

class Node {
private:
    vector<bool> bitmap;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public: 
    Node();
    Node(vector<int>* input, int alphabetMin, int alphabetMax, Node* parentNode);
    int rank(int character, int index, int alphabetMin, int alphabetMax);
    unsigned int binaryRankPopcountInstruction(unsigned int pos);
    int select(int character, int index);
    int binarySelect(bool charBit, int index);
    Node* getLeaf(int character, int alphabetMin, int alphabetMax);
};

#endif	/* NODE_H */

