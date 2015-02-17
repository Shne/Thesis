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
//    cout << size_out << endl;
//    cout << input[0] << endl;
    
    Tree tree = Tree(input, amount, alphabetSize);
    
    cout << tree.rank(2, amount) << endl;
//    struct rusage usage;
//    getrusage(RUSAGE_SELF, &usage);
//    printf("utime: %ld.%ld\n", usage.ru_utime.tv_sec, usage.ru_utime.tv_usec);
//    printf("stime: %ld.%ld\n", usage.ru_stime.tv_sec, usage.ru_stime.tv_usec);
    
    return 0;
}

