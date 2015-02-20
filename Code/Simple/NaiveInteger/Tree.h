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
    unsigned long alphabetMin, alphabetMax, inputSize;
    
public:
    Tree(vector<int>* input, int amount, int alphabetSize, uint skew);
    int rank(int character, unsigned long index, uint skew);
    int select(int character, unsigned long occurance, uint skew);
};



#endif	/* TREE_H */

