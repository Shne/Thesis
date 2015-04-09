/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#define PARTIALBLOCKS

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <unistd.h>
#define NDEBUG
#include <assert.h>

typedef std::vector<bool> bitmap_t;
typedef std::vector<uint> blockRanksVector;

using namespace std;

class Node {
private:
    ulong bitmapOffset;
    uint bitmapSize;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
    ulong popcountBinaryRank(ulong startOffset, ulong length, bitmap_t* bitmap);
public:
    Node();
    Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode,
         bitmap_t* in_bitmap, ulong &in_bitmapOffset, blockRanksVector &blockRanks,
         uint pageSize);
    
    int rank(int character, ulong index, bitmap_t* bitmap, int alphabetMin,
             int alphabetMax, blockRanksVector &pageRanks, uint pageSize);
    
    ulong binaryRank(ulong startOffset, ulong length, bitmap_t* bitmap);
    
    ulong blockBinaryRank(ulong pos, bitmap_t* bitmap, blockRanksVector &pageRanks, uint pageSize);
    
    uint select(int character, bool charBit, uint occurance, bitmap_t* bitmap,
               blockRanksVector &pageRanks, uint pageSize);
    
    uint binarySelect(bool charBit, ulong occurance, bitmap_t* bitmap);
    
    uint blockBinarySelect(bool charBit, uint occurance, bitmap_t* bitmap, blockRanksVector &blockRanks, uint blockSize);
    
    uint popcountBinarySelect(bool charBit, uint occurance, bitmap_t* bitmap, uint offset);
    
    Node* getLeaf(int character, int alphabetMin, int alphabetMax);
    
    uint leafSelect(int character, uint occurance, bitmap_t* bitmap, blockRanksVector &pageRanks, uint pageSize);
    
    inline void showBits(ulong n);
};

#endif	/* NODE_H */

