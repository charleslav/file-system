#include <gtest/gtest.h>
#include <src/file-system/FileSystem.h>


// Test case for Factorial function
TEST(FactorialTest, HandlesZeroInput) {
    EXPECT_EQ(Factorial(0), 1);
}