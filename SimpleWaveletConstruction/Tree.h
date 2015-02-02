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
//#include <forward_list>
#include "Node.h"

using namespace std;

class Tree {
    
private:
    Node root;
    
public:
    Tree(vector<char> s, char* alphabet, int alphabetSize) {
    char split = alphabet[alphabetSize/2];
    char* leftAlphabet = alphabet;
    int leftAlphabetSize = alphabetSize/2;
    char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    int rightAlphabetSize = alphabetSize - leftAlphabetSize;

    int i = 0;
    vector<char> left;
    vector<char> right;
    for(auto it = s.cbegin(); it == s.cend(); it++) {
        char c = *it;
        if(c <= split) {
            root.bitmap[i] = 0;
            left.push_back(c);
        } else {
            root.bitmap[i] = 1;
            right.push_back(c);
        }
        i++;
    }
}

};



#endif	/* TREE_H */

