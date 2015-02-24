/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"
#include <papi.h>


using namespace std;

void getPapiEventsOnMyComputer(){
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

Tree::Tree(vector<uint>* input, uint amount, uint alphabetSize, uint skew) 
    : alphabetMin(0), alphabetMax(alphabetSize-1), inputSize(amount){
    Node* node_pt = static_cast<Node*> (::operator new (sizeof(Node)*2*alphabetSize));
    root = node_pt;
    
    //getPapiEventsOnMyComputer();
    
    double dSkew = (double) skew;
//    unsigned long bitmapSize = amount * log2(alphabetSize) / log2(dSkew/(dSkew-1));
    ulong bitmapSize = amount * log2((double)2*alphabetSize + 1) / log2(1.0/(1.0-(1.0/dSkew)));

    bitmap = new bitmap_t(bitmapSize);
//    cout << bitmapSize << endl;
    unsigned long bitmapOffset = 0;

    new (root) Node(input, 0, alphabetSize-1, nullptr, node_pt, bitmap, bitmapOffset, skew);
    bitmap->resize(bitmapOffset);
    
    //289130500
    //120000000
}

int Tree::rank(int character, unsigned long index, uint skew) {
    if(index > inputSize) index = inputSize;
    return root->rank(character, index, alphabetMin, alphabetMax, skew);
}

int Tree::select(int character, unsigned long occurance, uint skew) {
    Node* leaf = root->getLeaf(character, alphabetMin, alphabetMax, skew);
    return leaf->leafSelect(character, occurance);
}

