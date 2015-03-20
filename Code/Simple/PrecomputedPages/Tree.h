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
#include <cmath>
#include "Node.h"
#include <iostream>


using namespace std;

class Tree {

private:
    Node* root;
    bitmap_t* bitmap __attribute__ ((aligned(def_pageSize)));
    vector<uint> pageRanks;
    unsigned long alphabetMin, alphabetMax, inputSize;
public:
    Tree(vector<uint>* input, uint amount, uint alphabetSize, float skew);
    int rank(int character, unsigned long index, float skew);
    int select(int character, unsigned long occurance, float skew);
};



#endif	/* TREE_H */

