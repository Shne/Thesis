/* 
 * File:   main.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:06 AM
 */

#include <cstdlib>
#include <iostream>
#include "Tree.h"

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    //Read string and alphabet 
    
    vector<char> string {'c','a','b','b','a','a'};
    const int alphabetSize = 3;
    char alphabet[alphabetSize] = {'a','b','c'};
    
    Tree tree = Tree(string, alphabet, alphabetSize);
    
    cout << "Test" << endl;
    return 0;
}

