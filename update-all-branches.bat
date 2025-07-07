@echo off
echo Updating all branches with correct icon and metadata...
echo.

REM Start from master branch
echo Starting from master branch...
git checkout master
if errorlevel 1 (
    echo Failed to checkout master branch
    pause
    exit /b 1
)

REM Update 1.21.5 branch
echo Updating 1.21.5 branch...
git checkout 1.21.5
if errorlevel 1 (
    echo Failed to checkout 1.21.5 branch
    pause
    exit /b 1
)

REM Update author name
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"PatrickSolberg\"', '\"Patrick Solberg\"' | Set-Content 'src/main/resources/fabric.mod.json'"

REM Update mod version
powershell -Command "(Get-Content 'gradle.properties') -replace 'mod_version=1.0.0', 'mod_version=1.0.0-1.21.5' | Set-Content 'gradle.properties'"

REM Update Minecraft version in fabric.mod.json
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"minecraft\": \"~1.21.7\"', '\"minecraft\": \"~1.21.5\"' | Set-Content 'src/main/resources/fabric.mod.json'"

echo 1.21.5 branch updated
echo.

REM Update 1.21.6 branch
echo Updating 1.21.6 branch...
git checkout 1.21.6
if errorlevel 1 (
    echo Failed to checkout 1.21.6 branch
    pause
    exit /b 1
)

REM Update author name
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"PatrickSolberg\"', '\"Patrick Solberg\"' | Set-Content 'src/main/resources/fabric.mod.json'"

REM Update mod version
powershell -Command "(Get-Content 'gradle.properties') -replace 'mod_version=1.0.0', 'mod_version=1.0.0-1.21.6' | Set-Content 'gradle.properties'"

REM Update Minecraft version in fabric.mod.json
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"minecraft\": \"~1.21.7\"', '\"minecraft\": \"~1.21.6\"' | Set-Content 'src/main/resources/fabric.mod.json'"

echo 1.21.6 branch updated
echo.

REM Update 1.21.7 branch
echo Updating 1.21.7 branch...
git checkout 1.21.7
if errorlevel 1 (
    echo Failed to checkout 1.21.7 branch
    pause
    exit /b 1
)

REM Update author name
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"PatrickSolberg\"', '\"Patrick Solberg\"' | Set-Content 'src/main/resources/fabric.mod.json'"

REM Update mod version
powershell -Command "(Get-Content 'gradle.properties') -replace 'mod_version=1.0.0', 'mod_version=1.0.0-1.21.7' | Set-Content 'gradle.properties'"

REM Update Minecraft version in fabric.mod.json
powershell -Command "(Get-Content 'src/main/resources/fabric.mod.json') -replace '\"minecraft\": \"~1.21.5\"', '\"minecraft\": \"~1.21.7\"' | Set-Content 'src/main/resources/fabric.mod.json'"

echo 1.21.7 branch updated
echo.

REM Return to master
git checkout master
echo Returned to master branch
echo.
echo All branches updated with correct metadata!
echo.
pause 