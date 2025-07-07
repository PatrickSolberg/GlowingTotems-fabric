# Quick Start Guide

## 🚀 Getting Started

### 1. Set Up Development Environment
```bash
# Windows
setup-dev-env.bat

# Linux/Mac
chmod +x setup-dev-env.sh
./setup-dev-env.sh
```

### 2. Test Your Mod
```bash
./gradlew runClient
```

### 3. Build for Specific Version
```bash
./gradlew buildForVersion -PtargetVersion=1.21.6
```

### 4. Build for All Versions
```bash
./gradlew buildAllVersions
```

## 📦 Creating a Release

1. **Update version:**
   ```bash
   # Edit gradle.properties
   mod_version=1.0.1
   ```

2. **Create tag:**
   ```bash
   git tag v1.0.1
   git push origin v1.0.1
   ```

3. **GitHub Actions will automatically:**
   - Build for all versions
   - Create release with JAR files
   - Upload to GitHub releases

## 🔄 Adding New Minecraft Version

1. **Update `build-versions.gradle`:**
   ```gradle
   '1.21.8': [
       minecraft: '1.21.8',
       yarn: '1.21.8+build.1',
       fabric: '0.128.1+1.21.8'
   ]
   ```

2. **Test the new version:**
   ```bash
   ./gradlew buildForVersion -PtargetVersion=1.21.8
   ./gradlew runClient
   ```

3. **Create branch:**
   ```bash
   git checkout -b 1.21.8
   git push origin 1.21.8
   ```

## 📁 File Structure
```
├── build-versions.gradle          # Multi-version builds
├── setup-dev-env.bat             # Windows setup
├── setup-dev-env.sh              # Unix setup
├── .github/workflows/build.yml   # Automated releases
├── VERSION_MANAGEMENT.md         # Detailed guide
└── QUICK_START.md               # This file
```

## 🎯 Next Steps

1. Read `VERSION_MANAGEMENT.md` for detailed workflow
2. Set up your Modrinth project
3. Configure GitHub repository settings
4. Test the automated build process

## 🆘 Need Help?

- Check `VERSION_MANAGEMENT.md` for troubleshooting
- Ensure JDK 21 is installed
- Verify all dependencies are downloaded
- Check GitHub Actions logs for build issues 