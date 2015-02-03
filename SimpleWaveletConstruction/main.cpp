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
    string sAlphabet, sInput, sAlphabetSize;

    getline(cin, sAlphabet);
    getline(cin, sAlphabetSize);
    getline(cin, sInput);

    int alphabetSize = atoi(sAlphabetSize.c_str());
    vector<char> input(sInput.begin(), sInput.end());
    const char* alphabet = sAlphabet.c_str();

    Tree tree = Tree(input, alphabet, alphabetSize);

    return 0;
}

