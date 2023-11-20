@echo off

REM Determine script directories
SET "HOOKS_ROOT=%~dp0"
SET "PLUGIN_ROOT=%~dp0\.."
SET "PLUGIN_BIN=%PLUGIN_ROOT%\bin"

REM Export _BUILDEVENT_STEP_START_TIME with the current Unix timestamp
FOR /F "delims=" %%i IN ('powershell -Command "Get-Date -UFormat %%s"') DO SET "_BUILDEVENT_STEP_START_TIME=%%i"

REM Make sure we have a buildevents binary
CALL "%PLUGIN_BIN%\fetch_exe.bat"

REM Check if buildevents exists in PLUGIN_BIN
IF EXIST "%PLUGIN_BIN%\buildevents.exe" (
    SET "BUILDEVENTS=buildevents.exe"
)
