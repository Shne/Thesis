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

inline void testBuildTime(char** argv, vector<uint>* input, uint amount, uint alphabetSize, uint skew){
    testBuildSetup();    
    Tree tree = Tree(input, amount, alphabetSize, skew);    
    testBuildTearDown(argv, skew);
}



int main(int argc, char** argv) {
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string inputFilename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << inputFilename << endl;
    uint size_out = 0;
    uint* inputArr = read_file(size_out, inputFilename.c_str());
    
    vector<uint>* input = new vector<uint>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    uint amount = pow(10, atoi(argv[1]));
    uint alphabetSize = pow(2, atoi(argv[2]));
    uint skew = atoi(argv[3]);
    
    //getPapiEventsOnMyComputer();
    
    /***************/
    /*  BUILDING  */
    /***************/
    
//    testBuildTime(argv, input, amount, alphabetSize, skew);
    
    
    /***************/
    /*  Quering    */
    /***************/
    Tree tree = Tree(input, amount, alphabetSize, skew);    
    testRankQuery(argv, amount, tree, skew);
//    testSelectQuery(argv, tree, skew);

    return 0;
}