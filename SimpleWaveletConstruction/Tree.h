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
    
public:
    Tree(vector<char> s, char* alphabet, int alphabetSize);
};



#endif	/* TREE_H */

