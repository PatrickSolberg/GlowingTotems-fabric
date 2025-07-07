@echo off
echo Setting up Fabric development environment...

REM Create run directory if it doesn't exist
if not exist "run" mkdir run
if not exist "run\mods" mkdir run\mods

REM Download Fabric API for the current version
echo Downloading Fabric API...
powershell -Command "& {Invoke-WebRequest -Uri 'https://modrinth.com/api/v1/version_file/0.128.1+1.21.5' -OutFile 'run\mods\fabric-api.jar'}"

REM Download LambDynamicLights for testing
echo Downloading LambDynamicLights...
powershell -Command "& {Invoke-WebRequest -Uri 'https://modrinth.com/api/v1/version_file/4.2.1+1.21.5' -OutFile 'run\mods\lambdynamiclights.jar'}"

echo Development environment setup complete!
echo.
echo To test the mod:
echo 1. Run: ./gradlew runClient
echo 2. Or use your IDE's run configuration
echo.
echo To build for a specific version:
echo ./gradlew buildForVersion -PtargetVersion=1.21.6
echo.
echo To build for all versions:
echo ./gradlew buildAllVersions 