# file-system

## Steps for installation
### 1. Install g++
```bash
sudo apt-get install g++
```
### 2. (Optional) Install Google test 
```bash
sudo apt install libgtest-dev
sudo apt install cmake
cd /usr/src/gtest
sudo cmake .
sudo make
sudo cp lib/*.a /usr/lib
```

### Reference
https://medium.com/@AlexanderObregon/introduction-to-unit-testing-and-test-driven-development-in-c-1a825a00b1b4