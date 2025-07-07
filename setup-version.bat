@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: setup-version.bat [version]
    echo Example: setup-version.bat 1.21.5
    echo.
    echo Available versions: 1.21.5, 1.21.6, 1.21.7
    exit /b 1
)

set TARGET_VERSION=%1
echo Setting up development environment for Minecraft %TARGET_VERSION%...

REM Checkout the correct branch
echo Checking out %TARGET_VERSION% branch...
git checkout %TARGET_VERSION%
if errorlevel 1 (
    echo Failed to checkout %TARGET_VERSION% branch
    exit /b 1
)

REM Create run directory if it doesn't exist
if not exist "run" mkdir run
if not exist "run\mods" mkdir run\mods

echo.
echo Downloading dependencies for Minecraft %TARGET_VERSION%...

REM Download Fabric API
echo Downloading Fabric API...
powershell -Command "& {try { Invoke-WebRequest -Uri 'https://cdn.modrinth.com/data/P7dR8mSH/versions/0.128.1%%2B%TARGET_VERSION%/fabric-api-0.128.1+%TARGET_VERSION%.jar' -OutFile 'run\mods\fabric-api.jar' -UseBasicParsing; Write-Host 'Fabric API downloaded successfully' } catch { Write-Host 'Failed to download Fabric API, please download manually from https://modrinth.com/mod/fabric-api' }}"

REM Download LambDynamicLights
echo Downloading LambDynamicLights...
powershell -Command "& {try { Invoke-WebRequest -Uri 'https://cdn.modrinth.com/data/yBW8D80W/versions/4.2.1%%2B%TARGET_VERSION%/lambdynamiclights-4.2.1+%TARGET_VERSION%.jar' -OutFile 'run\mods\lambdynamiclights.jar' -UseBasicParsing; Write-Host 'LambDynamicLights downloaded successfully' } catch { Write-Host 'Failed to download LambDynamicLights, please download manually from https://modrinth.com/mod/lambdynamiclights' }}"

echo.
echo Development environment setup complete for %TARGET_VERSION%!
echo.
echo To test the mod:
echo ./gradlew runClient
echo.
echo If downloads failed, please manually download:
echo 1. Fabric API for %TARGET_VERSION%: https://modrinth.com/mod/fabric-api
echo 2. LambDynamicLights for %TARGET_VERSION%: https://modrinth.com/mod/lambdynamiclights
echo.
pause 