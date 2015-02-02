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
//#include <set>
//#include <array>
//#include <forward_list>

using namespace std;

class Node {
private:
        std::vector<bool> bitmap;
        Node* left;
        Node* right;
public: 
    Node();
    Node(vector<char> s, char* alphabet, int alphabetSize) {
        
        char split = alphabet[alphabetSize/2];
        char* leftAlphabet = alphabet;
        int leftAlphabetSize = alphabetSize/2;
        char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
        int rightAlphabetSize = alphabetSize - leftAlphabetSize;

        int i = 0;
        vector<char> leftString;
        vector<char> rightString;
        for(auto it = s.cbegin(); it == s.cend(); it++) {
            char c = *it;
            if(c <= split) {
                bitmap[i] = 0;
                leftString.push_back(c);
            } else {
                bitmap[i] = 1;
                rightString.push_back(c);
            }
            i++;
        }
        left = new Node(leftString, leftAlphabet, leftAlphabetSize);
        right = new Node(rightString, rightAlphabet, rightAlphabetSize);
    }
};

#endif	/* NODE_H */

