/* 
 * File:   Tree.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:48 AM
 */

#ifndef TREE_H
#define	TREE_H

#include <string>
#include <set>
#include <array>
#include "Node.h"

using namespace std;

class Tree {
    
private:
    Node root;
    ulong alphabetMin, alphabetMax, inputSize;
    uint blockSize;
    float skew;
public:
    Tree(vector<uint>* input, uint amount, uint alphabetSize, uint blockSize, float skew);
    int rank(uint character, ulong index);
    int select(uint character, ulong occurance);
};



#endif	/* TREE_H */

