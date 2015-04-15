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

#define PATH_ARG_NUM 6


long_long start_cycles, end_cycles, start_usec, end_usec, start_virt_cycles, end_virt_cycles;

inline void handle_error (int retval) {
    printf("PAPI error %d: %s\n", retval, PAPI_strerror(retval));
    exit(1);
}

inline void getPapiAvailableEvents(){
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

inline void testSetup(int eventset, int* events, int num_events){
    PAPI_num_counters();          
    
    if(eventset == 0) {
        /* Start counting events */
        start_cycles = PAPI_get_real_cyc();
        start_virt_cycles = PAPI_get_virt_cyc();
        start_usec = PAPI_get_real_usec();
    }
    
    int retval = PAPI_start_counters(events, num_events);
    if (retval != PAPI_OK) handle_error(retval);
}

inline void testTearDown(uint amount, uint alphabetSize, string test, string pathname,
        uint blockSize, int eventset, int* events, long_long* values, int num_events) {
    /* Stop counting events */
    int retval = PAPI_stop_counters(values, num_events);
    if (retval != PAPI_OK) handle_error(retval);

    ofstream queryOutput(pathname, ios::app);

    if(eventset == 0) {
        end_cycles = PAPI_get_real_cyc();
        end_virt_cycles = PAPI_get_virt_cyc();
        end_usec = PAPI_get_real_usec();
        PAPI_dmem_info_t meminfo;
        PAPI_get_dmem_info(&meminfo);
        queryOutput << endl
#ifdef PARTIALBLOCKS
            << "algorithm=PreallocatedPrecomputed" << "\t"
#else
            << "algorithm=PreallocatedPrecomputedNoPartialBlocks" << "\t"
#endif
            << "test=" << test << "\t"
            << "amount=" << amount << "\t"
            << "alphabetSize=" << alphabetSize << "\t"
            << "blockSize=" << blockSize << "\t"
            << "real_cycles=" << end_cycles - start_cycles << "\t" //real cycles
            << "wall_time=" << end_usec - start_usec << "\t" //wall time in microseconds
            << "virt_cycles=" << end_virt_cycles - start_virt_cycles << "\t" //virtual cycles
            << "mem_size=" << meminfo.size << "\t"
            << "mem_resident=" << meminfo.resident << "\t"
            << "mem_highwatermark=" << meminfo.high_water_mark << "\t"
            ;
    }
    
    for(int i=0; i < num_events; i++) {
        char EventCodeStr[PAPI_MAX_STR_LEN];
        PAPI_event_code_to_name(events[i] | PAPI_PRESET_MASK, EventCodeStr);
        queryOutput << EventCodeStr << "=" << values[i] << "\t";
    }
}



inline void testSelectQuery(uint amount, uint alphabetSize, string pathname, uint blockSize,
        int eventset, int* events, long_long* values, int num_events, Tree tree) {
    testSetup(eventset, events, num_events);
    uint queries = 1000;
    uint charStep = alphabetSize/queries;
    uint occurrencePack = 10;
    uint occurrenceStep = queries/occurrencePack;
    uint maxOccurrence = 1000;
    ulong results[queries]; //just to make sure nothing is optimized away
    for(uint index = 0; index < queries; index++) {
        uint occurrence = ((index+1)*occurrenceStep) % maxOccurrence + (index+1)/occurrencePack;
        uint character = index*charStep;
        results[index] = tree.select(character, occurrence);
    }
    testTearDown(amount, alphabetSize, "select", pathname, blockSize, eventset, events, values, num_events);
    for(uint i=0; i < queries; i++) {
        cout << results[i] << " ";
    }
    cout << endl;
}

inline void testRankQuery(uint amount, uint alphabetSize, string pathname, uint blockSize, 
        int eventset, int* events, long_long* values, int num_events, Tree tree) {
    testSetup(eventset, events, num_events); 
    uint queries = 1000;
    uint charStep = alphabetSize/queries;
    uint posPack = 10;
    uint maxPos = amount;
    ulong posStep = maxPos/posPack;
    
    ulong results[queries]; //just to make sure nothing is optimized away
    for(uint index = 0; index < queries; index++) {
        uint pos = ((index+1)*posStep) % maxPos + (index+1)/posPack;
        uint character = index*charStep;
        results[index] = tree.rank(character, pos);
    }
    testTearDown(amount, alphabetSize, "rank", pathname, blockSize, eventset, events, values, num_events);
    for(uint i=0; i < queries; i++) {
        cout << results[i] << " ";
    }
    cout << endl;
}

inline void testBuildTime(uint amount, uint alphabetSize, string pathname, uint blockSize,
        int eventset, int* events, long_long* values, int num_events, vector<uint>* input) {
    testSetup(eventset, events, num_events);
    Tree tree = Tree(input, amount, alphabetSize, blockSize);
    testTearDown(amount, alphabetSize, "build", pathname, blockSize, eventset, events, values, num_events);
    
    cout << tree.rank(0, amount) << endl; //just to make sure nothing is optimized away
}

#endif	/* TESTS_H */

