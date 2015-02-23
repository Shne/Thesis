/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>

#define NUM_EVENTS 3

using namespace std;

void hurr(){
    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT) {
        fprintf(stderr,"PAPI library init error!\n");
        exit(1);
    }
    
    /* Check to see if papi presets ecists, exists */
    for(int i = 0; i < PAPI_END; i++){
        if(PAPI_query_event(i) != PAPI_OK){
            cout << i << ": false" << endl;
        }else{
            cout << i << ": true" << endl;
        }
    }
    
}

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint skew) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    
//    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT) {
//        fprintf(stderr,"PAPI library init error!\n");
//        exit(1);
//    }
//    
//    char EventCodeStr[PAPI_MAX_STR_LEN];
//    for(int i = 0; i < 108; i++){
//        PAPI_event_code_to_name(i | PAPI_PRESET_MASK, EventCodeStr);
//        
//        if(PAPI_query_event(i | PAPI_PRESET_MASK) != PAPI_OK){                        
//            cout << EventCodeStr << ": false" << endl;
//        }else{
//            cout << EventCodeStr << ": true" << endl;
//        }
//    }
    
    double dSkew = (double) skew;
    unsigned long bitmapSize = (unsigned long) amount * log2(alphabetSize) / log2(dSkew/(dSkew-1));
    
//    bitmap = new boost::dynamic_bitset<>(bitmapSize,0);
    bitmap = new bitmap_t(bitmapSize);
//    cout << bitmapSize << endl;
    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, skew);
    int Events[NUM_EVENTS] = { PAPI_TOT_CYC, PAPI_L1_TCM, PAPI_BR_MSP };
    long_long values[NUM_EVENTS];
    
    long_long start_cycles, end_cycles, start_usec, end_usec;
    int retval = PAPI_start_counters(Events, NUM_EVENTS);
    if (retval != PAPI_OK) cout << "Start Error: " << retval << endl;
    start_cycles = PAPI_get_real_cyc();
    start_usec = PAPI_get_real_usec();
    
    bitmap->shrink_to_fit();
    
    end_cycles = PAPI_get_real_cyc();
    end_usec = PAPI_get_real_usec();
    retval = PAPI_stop_counters(values, NUM_EVENTS);
    if (retval != PAPI_OK) cout << "End Error: " << retval << endl;
    
    
    
    cout << "real cycles: " << end_cycles - start_cycles << endl; //real cycles
    cout << "wall time in microseconds " << end_usec - start_usec << endl; //wall time in microseconds
    cout << "cycles " << values[0] << endl; // cycles
    cout << "cache misses " << values[1] << endl; // cache misses
    cout << "branch misses " << values[2] << endl; // cache misses
    
}

int Tree::rank(int character, unsigned long index, uint skew) {
    if(index > inputSize) index = inputSize;
    return root->rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
}

