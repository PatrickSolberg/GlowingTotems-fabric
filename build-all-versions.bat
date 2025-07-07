@echo off
echo Building Glowing Totems for all supported Minecraft versions...
echo.

REM Build for 1.21.5
echo Building for Minecraft 1.21.5...
call setup-version.bat 1.21.5
if errorlevel 1 (
    echo Failed to setup 1.21.5 environment
    pause
    exit /b 1
)
call gradlew build
if errorlevel 1 (
    echo Failed to build for 1.21.5
    pause
    exit /b 1
)
echo 1.21.5 build completed successfully!
echo.

REM Build for 1.21.6
echo Building for Minecraft 1.21.6...
call setup-version.bat 1.21.6
if errorlevel 1 (
    echo Failed to setup 1.21.6 environment
    pause
    exit /b 1
)
call gradlew build
if errorlevel 1 (
    echo Failed to build for 1.21.6
    pause
    exit /b 1
)
echo 1.21.6 build completed successfully!
echo.

REM Build for 1.21.7
echo Building for Minecraft 1.21.7...
call setup-version.bat 1.21.7
if errorlevel 1 (
    echo Failed to setup 1.21.7 environment
    pause
    exit /b 1
)
call gradlew build
if errorlevel 1 (
    echo Failed to build for 1.21.7
    pause
    exit /b 1
)
echo 1.21.7 build completed successfully!
echo.

echo All builds completed successfully!
echo.
echo Built JARs:
echo - build/libs/glowing-totems-1.0.0-1.21.5.jar
echo - build/libs/glowing-totems-1.0.0-1.21.6.jar  
echo - build/libs/glowing-totems-1.0.0-1.21.7.jar
echo.
pause 