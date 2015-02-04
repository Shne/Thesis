/* 
 * File:   main.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:06 AM
 */

#include <cstdlib>
#include <iostream>
#include "Tree.h"
#include <sys/time.h>
#include <sys/resource.h>

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
    
//    struct rusage usage;
//    getrusage(RUSAGE_SELF, &usage);
//    printf("utime: %ld.%ld\n", usage.ru_utime.tv_sec, usage.ru_utime.tv_usec);
//    printf("stime: %ld.%ld\n", usage.ru_stime.tv_sec, usage.ru_stime.tv_usec);
    
    return 0;
}

