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

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    if(argc < 3) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    int amount = pow(10, atoi(argv[1]));
    int alphabetSize = pow(2, atoi(argv[2]));

//    int alphabetSize = atoi(sAlphabetSize.c_str());
//    vector<char> input(sInput.begin(), sInput.end());
//    const char* alphabet = sAlphabet.c_str();
//    cout << amount << endl;
//    cout << alphabetSize << endl;
//    cout << input[0] << endl;
    
    Tree tree = Tree(input, amount, alphabetSize);
    
    long_long start_cycles, end_cycles, start_usec, end_usec;
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();
    
    int maxChar = 32;
    for(int character = 0; character < maxChar; character++) {
        unsigned long rank = tree.rank(character, amount);
//        cout << "rank: " << rank << endl;
//        unsigned long pos = tree.select(character, rank);
//        cout << "select: " << pos << endl;
    }

    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    printf("Wall clock cycles: %lld\n", end_cycles - start_cycles);
    printf("Wall clock time in microseconds: %lld\n", end_usec - start_usec);
    
    return 0;
}

