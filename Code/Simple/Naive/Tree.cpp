/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <iostream>

using namespace std;

Tree::Tree(vector<char> s, const char* alphabet, int alphabetSize) : 
    root(Node(s, alphabet, alphabetSize, nullptr))
    , alphabet(alphabet)
    , alphabetSize(alphabetSize)
{}


int Tree::rank(char character, int index){
    return root.rank(character, index, alphabet, alphabetSize);
}

int Tree::select(char character, int index){
    Node* leaf = root.getLeaf(character, alphabet, alphabetSize);
    return leaf->select(character, index);
}

void Tree::printAlphabet() {
    cout << "alphabet=";
    for(int i = 0; i < alphabetSize; i++) {
        cout << alphabet[i];
    }
    cout << endl;
}