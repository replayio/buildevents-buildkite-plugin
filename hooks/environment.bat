@echo off

REM Get the directory of the current script
SET "HOOKS_ROOT=%~dp0"
SET "PLUGIN_ROOT=%~dp0\.."
SET "PLUGIN_BIN=%PLUGIN_ROOT%\bin"

REM Add PLUGIN_BIN to the PATH
SET "PATH=%PATH%;%PLUGIN_BIN%"

REM Set buildevent environment variables to match plugin attributes
IF NOT "%BUILDKITE_PLUGIN_BUILDEVENTS_DATASET%"=="" (
    SET "BUILDEVENT_DATASET=%BUILDKITE_PLUGIN_BUILDEVENTS_DATASET%"
)
IF NOT "%BUILDKITE_PLUGIN_BUILDEVENTS_APIHOST%"=="" (
    SET "BUILDEVENT_APIHOST=%BUILDKITE_PLUGIN_BUILDEVENTS_APIHOST%"
)