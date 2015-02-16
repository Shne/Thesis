/* 
 * File:   Bitmap.h
 * Author: jhk
 *
 * Created on February 16, 2015, 1:29 PM
 */

#ifndef BITMAP_H
#define	BITMAP_H

#include <vector>



class Bitmap {    
    typedef unsigned long int position_t;
    typedef unsigned long int vector_element_t;
    typedef unsigned long int size_t;
public:
    Bitmap(size_t size);
    ~Bitmap();
    void set(position_t position, int value);
    int get(position_t position);
    vector_element_t* getPointer(size_t wordNumber);
    void push_back(int value);
private:
    std::vector<vector_element_t> vec;

};

#endif	/* BITMAP_H */

