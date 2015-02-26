/* 
 * File:   Tests.h
 * Author: roland
 *
 * Created on February 26, 2015, 4:06 PM
 */

#include <cstdlib>
#include <iostream>
#include "Tree.h"
#include <sys/time.h>
#include <sys/resource.h>
#include <cmath>
#include <papi.h>
#include "IO.h"

#ifndef TESTS_H
#define	TESTS_H

#define NUM_EVENTS 3

int Events[NUM_EVENTS] = { PAPI_TOT_CYC, PAPI_L1_TCM, PAPI_BR_MSP };
long_long values[NUM_EVENTS];
long_long start_cycles, end_cycles, start_usec, end_usec, start_virt_cycles, end_virt_cycles;

inline void handle_error (int retval) {
    printf("PAPI error %d: %s\n", retval, PAPI_strerror(retval));
    exit(1);
}

inline void getPapiEventsOnMyComputer(){
    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT) {
        fprintf(stderr,"PAPI library init error!\n");
        exit(1);
    }
    
    char EventCodeStr[PAPI_MAX_STR_LEN];
    for(int i = 0; i < 108; i++){
        PAPI_event_code_to_name(i | PAPI_PRESET_MASK, EventCodeStr);
        
        if(PAPI_query_event(i | PAPI_PRESET_MASK) != PAPI_OK){                        
            cout << EventCodeStr << ": false" << endl;
        }else{
            cout << EventCodeStr << ": true" << endl;
        }
    }
}

inline void testSelectSetup(){
    PAPI_num_counters();          
    
    /* Start counting events */
    start_cycles = PAPI_get_real_cyc();
    start_virt_cycles = PAPI_get_virt_cyc();
    start_usec = PAPI_get_real_usec();
    
    int retval = PAPI_start_counters(Events, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
}

inline void testSelectTearDown(char** argv, uint skew){
    /* Stop counting events */
    int retval = PAPI_stop_counters(values, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
    end_cycles = PAPI_get_real_cyc();
    end_virt_cycles = PAPI_get_virt_cyc();
    end_usec = PAPI_get_real_usec();
    
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + "_popcountSelect.output";
    ofstream queryOutput(queryOutputFilename, ios::app);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << end_virt_cycles - start_virt_cycles << "\t" //virtual cycles
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
}


inline void testRankSetup(){
    PAPI_num_counters();          
    
    /* Start counting events */
    start_cycles = PAPI_get_real_cyc();
    start_virt_cycles = PAPI_get_virt_cyc();
    start_usec = PAPI_get_real_usec();
    
    int retval = PAPI_start_counters(Events, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
}

inline void testRankTearDown(char** argv, uint skew){
    /* Stop counting events */
    int retval = PAPI_stop_counters(values, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
    end_cycles = PAPI_get_real_cyc();
    end_virt_cycles = PAPI_get_virt_cyc();
    end_usec = PAPI_get_real_usec();
    
    string queryOutputFilename = "../../../Output/naiveinteger_query_n" + string(argv[1]) + "_as" + string(argv[2]) + "_popcountRank.output";
    ofstream queryOutput(queryOutputFilename, ios::app);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << end_virt_cycles - start_virt_cycles << "\t" //virtual cycles
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
}

inline void testBuildSetup(){
    PAPI_num_counters();          
    
    /* Start counting events */
    start_cycles = PAPI_get_real_cyc();
    start_virt_cycles = PAPI_get_virt_cyc();
    start_usec = PAPI_get_real_usec();
    
    int retval = PAPI_start_counters(Events, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
}

inline void testBuildTearDown(char** argv, uint skew){
    /* Stop counting events */
    int retval = PAPI_stop_counters(values, NUM_EVENTS);
    if (retval != PAPI_OK) handle_error(retval);
    end_cycles = PAPI_get_real_cyc();
    end_virt_cycles = PAPI_get_virt_cyc();
    end_usec = PAPI_get_real_usec();
    
    string queryOutputFilename = "../../../Output/naiveinteger_build_n" + string(argv[1]) + "_as" + string(argv[2]) + ".output";
    ofstream queryOutput(queryOutputFilename, ios::app);

//    output << "# [SKEW] [lvl1 cache misses] [branch mispredictions]" << endl;
    queryOutput  << skew << "\t"
            << end_cycles - start_cycles << "\t" //real cycles
            << end_usec - start_usec << "\t" //wall time in microseconds
            << end_virt_cycles - start_virt_cycles << "\t" //virtual cycles
            << values[0] << "\t" // cycles
            << values[1] << "\t" // lvl1 cache misses
            << values[2] << endl; // branch mispredictions
}



#endif	/* TESTS_H */

