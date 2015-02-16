/* 
 * File:   Tree.cpp
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */


#include "Tree.h"

using namespace std;

Tree::Tree(vector<int> input, int amount, int alphabetSize) : root(Node(input, 0, alphabetSize-1))
{
}