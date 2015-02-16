/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#include <string>
#include <vector>
#include <limits.h>
#include "nmmintrin.h"



using namespace std;

class Node {
private:
    std::vector<bool> bitmap;        
    Node* left;
    Node* right;
    Node* parent;
        
public: 
    Node();
    Node(vector<char> s, const char* alphabet, int alphabetSize, Node* parentNode);
    bool isLeaf;
    std::vector<bool> getBitmap();
    Node* getLeftNode();
    Node* getRightNode();
    Node* getParentNode();
    Node* getLeaf(char character, const char* alphabet, int alphabetSize);
    int rank(char character, int index, const char* alphabet, int alphabetSize);
    int select(char character, int index);
    int binaryRank(bool charBit, int index);
    uint64_t binaryRankPopcount(uint64_t bitset, unsigned int position);
    unsigned int binaryRankPopcountInstruction(unsigned int pos);
    int binarySelect(bool charBit, int index);
    void printAlphabet(const char* alphabet, int alphabetSize);
    void calculateSplitAndAlphabet(char& split, int& rightAlphabetSize, int& leftAlphabetSize, 
    const char*& rightAlphabet, const char*& leftAlphabet, const char* alphabet, int alphabetSize);
};

#endif	/* NODE_H */

