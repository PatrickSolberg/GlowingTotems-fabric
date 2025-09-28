# Glowing Totems

A Fabric mod that makes the Totem of Undying emit light, even when dropped as an item, just like torches!

## Features

- **Dynamic Lighting**: The Totem of Undying now emits light level 15 when dropped as an item
- **No Block Placement**: Unlike traditional light sources, this doesn't place any blocks in the world
- **Seamless Integration**: Works with existing lighting systems and doesn't interfere with other mods
- **Data-Driven**: Uses LambDynamicLights' data-driven system for maximum compatibility

## Requirements

- Minecraft 1.21.5, 1.21.6, 1.21.7, 1.21.8, or 1.21.9
- Fabric Loader 0.16.14+
- Fabric API
- **LambDynamicLights** (required for the lighting effect to work)
- Java 17 or higher

## Installation

1. Install Fabric Loader for your Minecraft version
2. Install Fabric API
3. Install **LambDynamicLights** (required)
4. Download and install this mod

## How to Use

1. Obtain a Totem of Undying
2. Drop it on the ground
3. The totem will now emit light like a torch!

## Technical Details

This mod uses LambDynamicLights' data-driven system to register the Totem of Undying as a light source. The implementation is clean and efficient, requiring no mixins or complex modifications to vanilla code.

### Files Structure
```
src/main/resources/assets/glowing-totems/dynamiclights/
├── item/
│   └── totem_of_undying.json          # Defines totem luminance
└── entity/
    └── item_entity_totem.json         # Makes dropped totems glow
```

## Development

### Quick Start

To set up the development environment for the current version:

**Windows:**
```batch
.\setup-dev-env.bat
```

**Unix/Linux/macOS:**
```bash
./setup-dev-env.sh
```

### Multi-Version Development

To set up the development environment for a specific version:

**Windows:**
```batch
setup-version.bat 1.21.6
```

**Unix/Linux/macOS:**
```bash
./setup-version.sh 1.21.6
```

### Running the Mod

After setting up the development environment:

```bash
./gradlew runClient
```

This will:
1. Download the required dependencies (Fabric API and LambDynamicLights)
2. Place them in the `run/mods/` directory
3. Start Minecraft with your mod loaded

### Building

To build this mod from source:

```bash
./gradlew build
```

The compiled mod will be in `build/libs/`.

## Multi-Version Support

This mod supports multiple Minecraft versions:
- **1.21.5** - Stable release
- **1.21.6** - Stable release  
- **1.21.7** - Stable release
- **1.21.8** - Latest stable release
- **1.21.9** - Future release (when available)

To build for a specific version:
```bash
./gradlew buildForVersion -PtargetVersion=1.21.8
```

To build for all versions:
```bash
./gradlew buildAllVersions
```

## Future Updates

This mod is designed to be easily updated for future Minecraft versions:
- Uses data-driven configuration (no hardcoded values)
- Minimal codebase with no complex dependencies
- Follows Fabric mod best practices

## License

This mod is licensed under CC0 1.0 Universal License. 