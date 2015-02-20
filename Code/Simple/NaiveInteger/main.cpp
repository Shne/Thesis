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

#define NUM_EVENTS 3

using namespace std;

inline void handle_error (int retval) {
    printf("PAPI error %d: %s\n", retval, PAPI_strerror(retval));
    exit(1);
}

/*
 * 
 */
int main(int argc, char** argv) {
    if(argc < 4) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string filename = "../../../Data/n" + string(argv[1]) + "_as" + string(argv[2]) + ".data";
    cout << filename << endl;
    int size_out = 0;
    int* inputArr = read_file(size_out, filename.c_str());
    
    vector<int>* input = new vector<int>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    int amount = pow(10, atoi(argv[1]));
    int alphabetSize = pow(2, atoi(argv[2]));
    uint skew = atoi(argv[3]);
    
    
    int Events[NUM_EVENTS] = { PAPI_TOT_CYC, PAPI_L1_TCM, PAPI_BR_MSP };
    long_long values[NUM_EVENTS];
    long_long start_cycles, end_cycles, start_usec, end_usec;
    
    
    /***************/
    /*  BUILDING  */
    /***************/
    string buildOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream buildOutput(buildOutputFilename, ios::app);

    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();
    
    Tree tree = Tree(input, amount, alphabetSize, skew);
    
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);
    
    buildOutput << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // cache misses
            << values[2] << endl; // branch mispredictions
    
    
    
    
    /****************/
    /*  QUERYING   */
    /****************/
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream queryOutput(queryOutputFilename, ios::app);
    
    /* Start counting events */
    if (PAPI_start_counters(Events, NUM_EVENTS) != PAPI_OK) handle_error(1);
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();

    uint maxChar = 32;
    for(uint character = 0; character < maxChar; character++) {
        ulong rank = tree.rank(character, amount, skew);
        cout << "rank: " << rank << endl;
        unsigned long pos = tree.select(character, rank, skew);
        cout << "select: " << pos << endl;
    }

    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();

    /* Stop counting events */
    if (PAPI_stop_counters(values, NUM_EVENTS) != PAPI_OK) handle_error(1);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << values[0] << "\t" // cycles
            << values[1] << "\t" // cache misses
            << values[2] << endl; // branch mispredictions
    
    return 0;
}

