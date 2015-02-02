 
#include "Node.h"

using namespace std;


Node::Node(vector<char> s, char* alphabet, int alphabetSize) {
    if(alphabetSize == 1) {
        isLeaf = true;
        leafChar = alphabet[0];
        return;
    }
    char split = alphabet[alphabetSize/2];
    char* leftAlphabet = alphabet;
    int leftAlphabetSize = alphabetSize/2;
    char* rightAlphabet = alphabet + leftAlphabetSize*sizeof(char);
    int rightAlphabetSize = alphabetSize - leftAlphabetSize;

    int i = 0;
    vector<char> leftString;
    vector<char> rightString;
    for(auto it = s.cbegin(); it == s.cend(); it++) {
        char currentChar = *it;
        if(currentChar <= split) {
            bitmap[i] = 0;
            leftString.push_back(currentChar);
        } else {
            bitmap[i] = 1;
            rightString.push_back(currentChar);
        }
        i++;
    }
    left = new Node(leftString, leftAlphabet, leftAlphabetSize);
    right = new Node(rightString, rightAlphabet, rightAlphabetSize);
}
