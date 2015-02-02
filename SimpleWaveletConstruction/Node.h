/* 
 * File:   Node.h
 * Author: jhk
 *
 * Created on February 2, 2015, 11:14 AM
 */

#ifndef NODE_H
#define	NODE_H

#include <vector>

struct Node {
    public:
        std::vector<bool> bs;
        Node* left;
        Node* right;
};

#endif	/* NODE_H */

