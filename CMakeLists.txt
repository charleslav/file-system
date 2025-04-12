cmake_minimum_required(VERSION 3.22)
project("FileSystem")

find_package(GTest REQUIRED)

# Include the source directory
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_library(filesystem_lib
    src/file-system/FileSystem.cpp
    src/file-system/BlockDevice.cpp
)

# Rechercher automatiquement tous les fichiers de test
file(GLOB TEST_SOURCES "test/file-system/*.cpp")

# Créer un exécutable de test pour chaque fichier de test
foreach(TEST_SOURCE ${TEST_SOURCES})
    get_filename_component(TEST_NAME ${TEST_SOURCE} NAME_WE)
    add_executable(${TEST_NAME}.out ${TEST_SOURCE})
    target_link_libraries(${TEST_NAME}.out ${GTEST_LIBRARIES} filesystem_lib)
    add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME}.out)
endforeach()

# Définir l'emplacement des exécutables
enable_testing()