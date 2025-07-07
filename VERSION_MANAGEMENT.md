# Version Management Guide

This guide explains how to manage multiple Minecraft versions and releases for the Glowing Totems mod.

## Branch Strategy

- **`master`** - Latest development version (currently 1.21.7)
- **`1.21.5`** - Branch for Minecraft 1.21.5
- **`1.21.6`** - Branch for Minecraft 1.21.6
- **`1.21.7`** - Branch for Minecraft 1.21.7

## Development Workflow

### 1. Testing Your Mod

```bash
# Test current version
./gradlew runClient

# Test specific version
./gradlew buildForVersion -PtargetVersion=1.21.6
./gradlew runClient
```

### 2. Building for Different Versions

```bash
# Build for specific version
./gradlew buildForVersion -PtargetVersion=1.21.6

# Build for all versions
./gradlew buildAllVersions
```

## Release Process

### 1. Update for New Minecraft Version

When a new Minecraft version is released:

1. **Update `build-versions.gradle`:**
   ```gradle
   '1.21.8': [
       minecraft: '1.21.8',
       yarn: '1.21.8+build.1',
       fabric: '0.128.1+1.21.8'
   ]
   ```

2. **Create new branch:**
   ```bash
   git checkout -b 1.21.8
   git push origin 1.21.8
   ```

3. **Test the new version:**
   ```bash
   ./gradlew buildForVersion -PtargetVersion=1.21.8
   ./gradlew runClient
   ```

### 2. Creating a Release

1. **Update version in `gradle.properties`:**
   ```properties
   mod_version=1.0.1
   ```

2. **Create and push tag:**
   ```bash
   git tag v1.0.1
   git push origin v1.0.1
   ```

3. **GitHub Actions will automatically:**
   - Build for all supported versions
   - Create a GitHub release
   - Upload JAR files

### 3. Publishing to Modrinth

1. Go to your Modrinth project
2. Create a new version
3. Upload the JAR files from the GitHub release
4. Set the appropriate Minecraft version compatibility

## File Structure

```
GlowingTotems-fabric/
├── build-versions.gradle          # Multi-version build script
├── .github/workflows/build.yml   # Automated builds
├── src/main/resources/assets/glowing-totems/dynamiclights/
│   ├── item/totem_of_undying.json
│   └── entity/item_entity_totem.json
└── VERSION_MANAGEMENT.md         # This file
```

## Supported Versions

Currently supported Minecraft versions:
- 1.21.5 ✅
- 1.21.6 ✅
- 1.21.7 ✅

## Requirements

- **Java 17 or higher** (required for development and building)
- Fabric Loader 0.16.14+
- Fabric API
- LambDynamicLights (for testing)

## Troubleshooting

### Build Issues
- Ensure you have JDK 17 installed
- Run `./gradlew clean` before building
- Check that all dependencies are available

### Testing Issues
- Make sure LambDynamicLights is in `run/mods/`
- Verify Fabric API version matches Minecraft version
- Check logs for any missing dependencies

### Version Compatibility
- Each version branch should be tested independently
- Use the dev environment to test before releasing
- Always test with the latest Fabric Loader version 