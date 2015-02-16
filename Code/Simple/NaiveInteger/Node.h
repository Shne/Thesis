/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#define SKEW 4

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <boost/dynamic_bitset.hpp>

using namespace std;

class Node {
private:
    boost::dynamic_bitset<> bitmap;
    bool isLeaf;
    Node* left;
    Node* right;
public: 
    Node();
    Node(vector<int> input, int alphabetMin, int alphabetMax);
};

#endif	/* NODE_H */

