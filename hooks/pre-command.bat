@echo off

REM Determine script directories
SET "HOOKS_ROOT=%~dp0"
SET "PLUGIN_ROOT=%~dp0\.."
SET "PLUGIN_BIN=%PLUGIN_ROOT%\bin"

REM Export _BUILDEVENT_STEP_START_TIME with the current Unix timestamp
for /f %%x in ('powershell -command "(Get-Date -UFormat '%%s') -replace '\..*'"') do set "_BUILDEVENT_STEP_START_TIME=%%x"

REM Make sure we have a buildevents binary
CALL "%PLUGIN_BIN%\fetch_exe.bat"

REM Check if buildevents exists in PLUGIN_BIN
IF EXIST "%PLUGIN_BIN%\buildevents.exe" (
    SET "BUILDEVENTS=buildevents.exe"
)
