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
#include <cmath>
#include <papi.h>
#include "IO.h"
#include "Tests.h"

using namespace std;

inline void testSelectQuery(char** argv, Tree tree, uint skew){
    testSelectSetup();    
    uint maxChar = 100;
    for(uint character = 0; character < maxChar; character++) {
        unsigned long pos = tree.select(character, 2000, skew);
    }
    testSelectTearDown(argv, skew);

    
}

inline void testRankQuery(char** argv, int amount, Tree tree, uint skew){
    testRankSetup(); 
    uint maxChar = 100;
    for(uint character = 0; character < maxChar; character++) {
        ulong rank = tree.rank(character, amount, skew);
    }
    testRankTearDown(argv, skew);
}

inline void testBuildTime(char** argv, vector<int>* input, int amount, int alphabetSize, uint skew){
    testBuildSetup();    
    Tree tree = Tree(input, amount, alphabetSize, skew);    
    testBuildTearDown(argv, skew);
    
}


int main(int argc, char** argv) {
    if(argc < 5) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    int amount = pow(10, atoi(argv[1]));
    int alphabetSize = pow(2, atoi(argv[2]));
    uint skew = atoi(argv[3]);
    
    
    /***************/
    /*  Tests      */
    /***************/
    if(string(argv[4]) == "build") {
        testBuildTime(argv, input, amount, alphabetSize, skew);
    }
    else if(string(argv[4]) == "rank"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testRankQuery(argv, amount, tree, skew);
    }        
    else if(string(argv[4]) == "select"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testSelectQuery(argv, amount, tree, skew);
    }
    return 0;
}





