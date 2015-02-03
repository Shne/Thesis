/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<char> s, const char* alphabet, int alphabetSize) : root(Node::Node(s, alphabet, alphabetSize))
{
}