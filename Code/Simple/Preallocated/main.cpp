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

#define NUM_EVENTS 2

using namespace std;

inline void handle_error (int retval) {
    printf("PAPI error %d: %s\n", retval, PAPI_strerror(retval));
    exit(1);
}

/*
 * 
 */
int main(int argc, char** argv) {
    if(argc < 3) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string inputFilename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    string outputFilename = "../../../Output/preallocated_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream output(outputFilename, ios::app);
    cout << inputFilename << endl;
    uint size_out = 0;
    uint* inputArr = read_file(size_out, inputFilename.c_str());
    
    vector<uint>* input = new vector<uint>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    uint amount = pow(10, atoi(argv[1]));
    uint alphabetSize = pow(2, atoi(argv[2]));

//    int alphabetSize = atoi(sAlphabetSize.c_str());
//    vector<char> input(sInput.begin(), sInput.end());
//    const char* alphabet = sAlphabet.c_str();
//    cout << amount << endl;
//    cout << alphabetSize << endl;
//    cout << input[0] << endl;
    
    Tree tree = Tree(input, amount, alphabetSize);
    
    /* Initialize the library */
//    PAPI_event_info_t info;
//    int retval = PAPI_library_init(PAPI_VER_CURRENT);
//    if (retval != PAPI_VER_CURRENT) {
//        fprintf(stderr,"PAPI library init error!\n");
//        exit(1);
//    }
//    retval = PAPI_query_event( PAPI_TLB_TL );
//    if (retval != PAPI_OK) {
//        handle_error( retval );
//    }

    int Events[NUM_EVENTS] = { PAPI_L1_TCM, PAPI_BR_MSP };
    long_long values[NUM_EVENTS];
    long_long start_cycles, end_cycles, start_usec, end_usec;
    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);

    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();

    uint maxChar = 32;
    for(uint character = 0; character < maxChar; character++) {
        ulong rank = tree.rank(character, amount);
//        cout << "rank: " << rank << endl;
        unsigned long pos = tree.select(character, rank);
//        cout << "select: " << pos << endl;
    }

    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    output << "  " << SKEW << "\t" << values[0] << "\t" << values[1] << endl;

    printf("Wall clock cycles: %lld\n", end_cycles - start_cycles);
    printf("Wall clock time in microseconds: %lld\n", end_usec - start_usec);

    return 0;
}

