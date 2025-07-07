#!/bin/bash
echo "Setting up Fabric development environment..."

# Create run directory if it doesn't exist
mkdir -p run/mods

# Download Fabric API for the current version
echo "Downloading Fabric API..."
curl -L -o run/mods/fabric-api.jar "https://modrinth.com/api/v1/version_file/0.128.1+1.21.5"

# Download LambDynamicLights for testing
echo "Downloading LambDynamicLights..."
curl -L -o run/mods/lambdynamiclights.jar "https://modrinth.com/api/v1/version_file/4.2.1+1.21.5"

echo "Development environment setup complete!"
echo ""
echo "To test the mod:"
echo "1. Run: ./gradlew runClient"
echo "2. Or use your IDE's run configuration"
echo ""
echo "To build for a specific version:"
echo "./gradlew buildForVersion -PtargetVersion=1.21.6"
echo ""
echo "To build for all versions:"
echo "./gradlew buildAllVersions" 