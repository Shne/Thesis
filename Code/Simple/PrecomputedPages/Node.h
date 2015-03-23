/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

//#define SKEW 2

#include <string>
#include <vector>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <unistd.h>

typedef std::vector<bool> bitmap_t;

using namespace std;

class Node {
private:
    unsigned long bitmapOffset;
    unsigned long bitmapSize;
    bool isLeaf;
    Node* parent;
    Node* left;
    Node* right;
public:
    Node();
    Node(vector<uint>* input, uint alphabetMin, uint alphabetMax, Node* parentNode,
         Node* &node_pt, bitmap_t* in_bitmap, ulong &in_bitmapOffset, float skew,
         vector<ushort> &blockRanks, uint pageSize);
    
    int rank(int character, ulong index, bitmap_t* bitmap, int alphabetMin,
             int alphabetMax, float skew, vector<ushort> &pageRanks, uint pageSize);
    
    ulong popcountBinaryRank(ulong pos, bitmap_t* bitmap, vector<ushort> &pageRanks, uint pageSize);
    
    ulong binaryRank(ulong index, bitmap_t* bitmap);
    
    int select(int character, bool charBit, ulong occurance, bitmap_t* bitmap,
               vector<ushort> &pageRanks, uint pageSize);
    
    int binarySelect(bool charBit, ulong occurance, bitmap_t* bitmap);
    
    int popcountBinarySelect(bool charBit, ulong occurance, bitmap_t* bitmap);
    
    Node* getLeaf(int character, int alphabetMin, int alphabetMax, float skew);
    
    int leafSelect(int character, ulong occurance, bitmap_t* bitmap, vector<ushort> &pageRanks, uint pageSize);
    
    inline void showBits(ulong n);
};

#endif	/* NODE_H */

