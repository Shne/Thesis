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


using namespace std;

class Node {
private:
        std::vector<bool> bitmap;        
        Node* left;
        Node* right;
        
public: 
    Node();
    Node(vector<char> s, const char* alphabet, int alphabetSize);
    bool isLeaf;
    std::vector<bool> getBitmap();
    Node* getLeftNode();
    Node* getRightNode();
    void printAlphabet(const char* alphabet, int alphabetSize);
};

#endif	/* NODE_H */

