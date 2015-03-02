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

#define N_ARG_NUM 1
#define AS_ARG_NUM 2
#define SKEW_ARG_NUM 3
#define TEST_ARG_NUM 4
#define EVENTSET_ARG_NUM 5
#define FILENAME_ARG_NUM 6
#define NUM_REQUIRED_ARGS 6

using namespace std;





int main(int argc, char** argv) {
    if(argc < NUM_REQUIRED_ARGS) { cout << "NOT ENOUGH ARGUMENTS" << endl; return 0; }
    
    string inputFilename = "../../../Data/n" + string(argv[N_ARG_NUM]) + "_as" + string(argv[AS_ARG_NUM]) + ".data";
    cout << inputFilename << endl;
    uint size_out = 0;
    uint* inputArr = read_file(size_out, inputFilename.c_str());
    
    vector<uint>* input = new vector<uint>(inputArr, inputArr + size_out);
    delete[] inputArr;
    
    uint amount = pow(10, atoi(argv[N_ARG_NUM]));
    uint alphabetSize = pow(2, atoi(argv[AS_ARG_NUM]));
    uint skew = atoi(argv[SKEW_ARG_NUM]);
    
    /***************/
    /*  Events       */
    /***************/
    int* events;
    long_long* values;
    int num_events;
    int eventset = atoi(argv[EVENTSET_ARG_NUM]);
    if(eventset == 0) {
        num_events = 3;
        events = new int[3] { PAPI_TOT_CYC, PAPI_L1_TCM, PAPI_BR_MSP };
        values = new long_long[3];
    } else if(eventset == 1) {
        num_events = 3;
        events = new int[3] { PAPI_TLB_DM, PAPI_L2_TCM, PAPI_L3_TCM };
        values = new long_long[3];
    }
    
    /***************/
    /*  Output file */
    /***************/
    string pathname = "../../../Output/";
    if(argc > FILENAME_ARG_NUM) {
        pathname += string(argv[FILENAME_ARG_NUM]);
    } else {
        pathname += "default.output";
    }
    cout << pathname << endl;
    
    /***************/
    /*  Run tests   */
    /***************/
    string test = string(argv[TEST_ARG_NUM]);
    if(test == "build") {
        testBuildTime(amount, alphabetSize, skew, pathname, eventset, events, values, num_events, input);
    }
    else if(test == "rank"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testRankQuery(amount, alphabetSize, skew, pathname, eventset, events, values, num_events, tree);
    }
    else if(test == "select"){
        Tree tree = Tree(input, amount, alphabetSize, skew);    
        testSelectQuery(amount, alphabetSize, skew, pathname, eventset, events, values, num_events, tree);
    }

    return 0;
}