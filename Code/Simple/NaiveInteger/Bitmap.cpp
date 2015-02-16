
#include "Bitmap.h"

Bitmap::Bitmap(size_t size) : vec(size) {};

void Bitmap::set(position_t position, int value) {
    position_t wordIndex = position / sizeof(vector_element_t);
    
}
int Bitmap::get(unsigned long int position) {
    
}
unsigned long int* Bitmap::getPointer(unsigned long int wordNumber) {
    
}








