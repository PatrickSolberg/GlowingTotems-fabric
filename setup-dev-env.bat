@echo off
echo Setting up Fabric development environment...

REM Get current Minecraft version from gradle.properties
for /f "tokens=2 delims==" %%i in ('findstr "minecraft_version" gradle.properties') do set MC_VERSION=%%i
set MC_VERSION=%MC_VERSION: =%

echo Detected Minecraft version: %MC_VERSION%

REM Create run directory if it doesn't exist
if not exist "run" mkdir run
if not exist "run\mods" mkdir run\mods

echo.
echo Downloading dependencies for Minecraft %MC_VERSION%...

REM Download Fabric API
echo Downloading Fabric API...
powershell -Command "& {try { Invoke-WebRequest -Uri 'https://cdn.modrinth.com/data/P7dR8mSH/versions/0.128.1%%2B%MC_VERSION%/fabric-api-0.128.1+%MC_VERSION%.jar' -OutFile 'run\mods\fabric-api.jar' -UseBasicParsing; Write-Host 'Fabric API downloaded successfully' } catch { Write-Host 'Failed to download Fabric API, please download manually from https://modrinth.com/mod/fabric-api' }}"

REM Download LambDynamicLights
echo Downloading LambDynamicLights...
powershell -Command "& {try { Invoke-WebRequest -Uri 'https://cdn.modrinth.com/data/yBW8D80W/versions/4.2.1%%2B%MC_VERSION%/lambdynamiclights-4.2.1+%MC_VERSION%.jar' -OutFile 'run\mods\lambdynamiclights.jar' -UseBasicParsing; Write-Host 'LambDynamicLights downloaded successfully' } catch { Write-Host 'Failed to download LambDynamicLights, please download manually from https://modrinth.com/mod/lambdynamiclights' }}"

echo.
echo Development environment setup complete!
echo.
echo To test the mod:
echo ./gradlew runClient
echo.
echo If downloads failed, please manually download:
echo 1. Fabric API for %MC_VERSION%: https://modrinth.com/mod/fabric-api
echo 2. LambDynamicLights for %MC_VERSION%: https://modrinth.com/mod/lambdynamiclights
echo.
pause 