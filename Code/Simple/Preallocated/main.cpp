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
#include <papi.h>
#include "IO.h"
#include "Tests.h"

#define NUM_EVENTS 3

using namespace std;

inline void testSelectQuery(int argc, char** argv, Tree tree, uint skew){
    testSelectSetup();    
    uint maxChar = 100;
    int maxPosition = 2000;
    int positionStepSize = maxPosition/maxChar;
    int position = positionStepSize;
    for(uint character = 0; character < maxChar; character++) {
        unsigned long pos = tree.select(character, position, skew);
        position += positionStepSize;
    }
    testSelectTearDown(argc, argv, skew);    
}

inline void testRankQuery(int argc, char** argv, int amount, Tree tree, uint skew){
    testRankSetup(); 
    uint maxChar = 100;
    for(uint character = 0; character < maxChar; character++) {
        ulong rank = tree.rank(character, amount, skew);
    }
    testRankTearDown(argc, argv, skew);
}

inline void testBuildTime(int argc, char** argv, vector<uint>* input, uint amount, uint alphabetSize, uint skew){
    testBuildSetup();    
    Tree tree = Tree(input, amount, alphabetSize, skew);    
    testBuildTearDown(argc, argv, skew);
}



int main(int argc, char** argv) {
    if(argc < 5) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string inputFilename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << inputFilename << endl;
    uint size_out = 0;
    uint* inputArr = read_file(size_out, inputFilename.c_str());
    
    vector<uint>* input = new vector<uint>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    uint amount = pow(10, atoi(argv[1]));
    uint alphabetSize = pow(2, atoi(argv[2]));
    uint skew = atoi(argv[3]);
    
    /***************/
    /*  Tests      */
    /***************/
    if(string(argv[4]) == "build") {
        testBuildTime(argc, argv, input, amount, alphabetSize, skew);
    }
    else if(string(argv[4]) == "rank"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testRankQuery(argc, argv, amount, tree, skew);
    }
    else if(string(argv[4]) == "select"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testSelectQuery(argc, argv, tree, skew);
    }

    return 0;
}