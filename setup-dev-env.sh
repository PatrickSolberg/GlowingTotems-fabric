#!/bin/bash
echo "Setting up Fabric development environment..."

# Get current Minecraft version from gradle.properties
MC_VERSION=$(grep "minecraft_version" gradle.properties | cut -d'=' -f2 | tr -d ' ')

echo "Detected Minecraft version: $MC_VERSION"

# Create run directory if it doesn't exist
mkdir -p run/mods

echo ""
echo "Downloading dependencies for Minecraft $MC_VERSION..."

# Download Fabric API
echo "Downloading Fabric API..."
if curl -L -o run/mods/fabric-api.jar "https://cdn.modrinth.com/data/P7dR8mSH/versions/0.128.1%2B$MC_VERSION/fabric-api-0.128.1+$MC_VERSION.jar" 2>/dev/null; then
    echo "Fabric API downloaded successfully"
else
    echo "Failed to download Fabric API, please download manually from https://modrinth.com/mod/fabric-api"
fi

# Download LambDynamicLights
echo "Downloading LambDynamicLights..."
if curl -L -o run/mods/lambdynamiclights.jar "https://cdn.modrinth.com/data/yBW8D80W/versions/4.2.1%2B$MC_VERSION/lambdynamiclights-4.2.1+$MC_VERSION.jar" 2>/dev/null; then
    echo "LambDynamicLights downloaded successfully"
else
    echo "Failed to download LambDynamicLights, please download manually from https://modrinth.com/mod/lambdynamiclights"
fi

echo ""
echo "Development environment setup complete!"
echo ""
echo "To test the mod:"
echo "./gradlew runClient"
echo ""
echo "If downloads failed, please manually download:"
echo "1. Fabric API for $MC_VERSION: https://modrinth.com/mod/fabric-api"
echo "2. LambDynamicLights for $MC_VERSION: https://modrinth.com/mod/lambdynamiclights" 