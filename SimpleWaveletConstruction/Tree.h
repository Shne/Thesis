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
    Tree(string s, vector<char> alphabet) {
    char split = alphabet[alphabet.size()/2];

    for(auto it = s.cbegin(); it == s.cend(); it++) {
        char c = *it;
        if(c <= split) {
            
        }
    }
}

};



#endif	/* TREE_H */

