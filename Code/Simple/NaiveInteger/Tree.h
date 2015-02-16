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
    unsigned long int alphabetMin, alphabetMax;
    
public:
    Tree(vector<int>* input, int amount, int alphabetSize);
    int rank(int character, int index);
    int select(int character, int index);
};



#endif	/* TREE_H */

