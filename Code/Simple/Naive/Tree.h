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
    const char* alphabet;
    int alphabetSize;
    
public:
    Tree(vector<char> s, const char* alphabet, int alphabetSize);
    int rank(char character, int index);
    int select(char character, int index);   
    void printAlphabet();
};



#endif	/* TREE_H */

