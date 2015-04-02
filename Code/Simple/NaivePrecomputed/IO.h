/* 
 * File:   IO.h
 * Author: jhk
 *
 * Created on February 9, 2015, 12:38 PM
 * Adapted from the examples at http://www.cplusplus.com/doc/tutorial/files/
 */

#ifndef IO_H
#define	IO_H

#include <cstdlib>
#include <iostream>
#include <fstream>
#include <stdlib.h>

using namespace std;

/** Read file from external memory, as integers
 * 
 * @param [out] size_out total number of integers read from memory
 * @param [in] filename name of file to be read
 * 
 * @returns a pointer to a newly created array containing the data, remember to delete[] this
 * 
 */
inline uint* read_file(uint& size_out, const char* filename) {
    streampos size;
    uint * arr = nullptr;
//    vector<int>* arr = new vector<int>(size/sizeof(int));
    ifstream file(filename, ios::in|ios::binary|ios::ate);
    if(file.is_open())
    {
        size = file.tellg();
//        cout << "Size: " << size << endl;
//        cout << "sizeof(int): " << sizeof(int) << endl;
//        cout << "Elements: " << size/sizeof(int) << endl;
        size_out = size/sizeof(uint);
        arr = new uint[size/sizeof(uint)];
        file.seekg(0, ios::beg);
        file.read((char*) arr, size);
    }
    else 
    {
        cout << "IO ERROR" << endl;
    }
    return arr;
}


#endif	/* IO_H */

