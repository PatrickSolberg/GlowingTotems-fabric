@echo off
setlocal enabledelayedexpansion
for %%v in (1.21.5 1.21.6 1.21.7) do (
  call gradlew.bat buildForVersion -PtargetVersion=%%v
  if errorlevel 1 exit /b !errorlevel!
)
endlocal 