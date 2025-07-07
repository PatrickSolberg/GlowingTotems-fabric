#!/bin/bash

echo "Building Glowing Totems for all supported Minecraft versions..."
echo

# Build for 1.21.5
echo "Building for Minecraft 1.21.5..."
./setup-version.sh 1.21.5
if [ $? -ne 0 ]; then
    echo "Failed to setup 1.21.5 environment"
    exit 1
fi
./gradlew build
if [ $? -ne 0 ]; then
    echo "Failed to build for 1.21.5"
    exit 1
fi
echo "1.21.5 build completed successfully!"
echo

# Build for 1.21.6
echo "Building for Minecraft 1.21.6..."
./setup-version.sh 1.21.6
if [ $? -ne 0 ]; then
    echo "Failed to setup 1.21.6 environment"
    exit 1
fi
./gradlew build
if [ $? -ne 0 ]; then
    echo "Failed to build for 1.21.6"
    exit 1
fi
echo "1.21.6 build completed successfully!"
echo

# Build for 1.21.7
echo "Building for Minecraft 1.21.7..."
./setup-version.sh 1.21.7
if [ $? -ne 0 ]; then
    echo "Failed to setup 1.21.7 environment"
    exit 1
fi
./gradlew build
if [ $? -ne 0 ]; then
    echo "Failed to build for 1.21.7"
    exit 1
fi
echo "1.21.7 build completed successfully!"
echo

echo "All builds completed successfully!"
echo
echo "Built JARs:"
echo "- build/libs/glowing-totems-1.0.0-1.21.5.jar"
echo "- build/libs/glowing-totems-1.0.0-1.21.6.jar"
echo "- build/libs/glowing-totems-1.0.0-1.21.7.jar"
echo 