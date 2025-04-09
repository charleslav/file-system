//
// NOM PRENOM :
// IDUL :
//

#ifndef BLOCKDEVICE_H
#define BLOCKDEVICE_H

#include <vector>
#include <string>
#include <fstream>
#include <iostream>

/**
 * BlockDevice simule un disque virtuel de 64 Ko
 * découpé en blocs de 1 Ko.
 */
class BlockDevice {
private:
    std::vector<char> disk;

public:
    BlockDevice();
    bool ReadBlock(size_t blockIndex, char* buffer);
    bool WriteBlock(size_t blockIndex, const char* data);
};
#endif //BLOCKDEVICE_H
