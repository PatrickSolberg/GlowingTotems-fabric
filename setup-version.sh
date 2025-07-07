#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: ./setup-version.sh [version]"
    echo "Example: ./setup-version.sh 1.21.5"
    echo ""
    echo "Available versions: 1.21.5, 1.21.6, 1.21.7"
    exit 1
fi

TARGET_VERSION=$1
echo "Setting up development environment for Minecraft $TARGET_VERSION..."

# Checkout the correct branch
echo "Checking out $TARGET_VERSION branch..."
git checkout $TARGET_VERSION

# Create run directory if it doesn't exist
mkdir -p run/mods

echo ""
echo "Downloading dependencies for Minecraft $TARGET_VERSION..."

# Download Fabric API
echo "Downloading Fabric API..."
if curl -L -o run/mods/fabric-api.jar "https://cdn.modrinth.com/data/P7dR8mSH/versions/0.128.1%2B$TARGET_VERSION/fabric-api-0.128.1+$TARGET_VERSION.jar" 2>/dev/null; then
    echo "Fabric API downloaded successfully"
else
    echo "Failed to download Fabric API, please download manually from https://modrinth.com/mod/fabric-api"
fi

# Download LambDynamicLights
echo "Downloading LambDynamicLights..."
if curl -L -o run/mods/lambdynamiclights.jar "https://cdn.modrinth.com/data/yBW8D80W/versions/4.2.1%2B$TARGET_VERSION/lambdynamiclights-4.2.1+$TARGET_VERSION.jar" 2>/dev/null; then
    echo "LambDynamicLights downloaded successfully"
else
    echo "Failed to download LambDynamicLights, please download manually from https://modrinth.com/mod/lambdynamiclights"
fi

echo ""
echo "Development environment setup complete for $TARGET_VERSION!"
echo ""
echo "To test the mod:"
echo "./gradlew runClient"
echo ""
echo "If downloads failed, please manually download:"
echo "1. Fabric API for $TARGET_VERSION: https://modrinth.com/mod/fabric-api"
echo "2. LambDynamicLights for $TARGET_VERSION: https://modrinth.com/mod/lambdynamiclights" 