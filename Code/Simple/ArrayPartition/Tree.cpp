/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(char* stringBegin, char* stringEnd, const char* alphabet, int alphabetSize) : root(Node(stringBegin, stringEnd, alphabet, alphabetSize))
{
}