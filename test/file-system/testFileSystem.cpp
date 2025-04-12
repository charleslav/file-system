#include <gtest/gtest.h>
#include "src/file-system/FileSystem.h"


// Test case for Factorial function
TEST(FileSystemTest, InitializeFreeBitMapAtInitialization) {
    BlockDevice block;
    FileSystem fs(block);
    EXPECT_TRUE(true);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}