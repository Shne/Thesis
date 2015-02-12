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
    boost::dynamic_bitset<>* bitmap;
    
public:
    Tree(vector<int>* input, int amount, int alphabetSize);
};



#endif	/* TREE_H */

