@echo off
SETLOCAL

SET "BUILDEVENTS_GH_ORG=replayio"
SET "BUILDEVENTS_RELEASE=toshok/add-buildkite-watch-v0.3"

:: For now, assume amd64.  is there a way to detect this?
SET "ARCH=amd64"

SET "PLUGIN_BIN=%~dp0"

:: Download buildevents if not exists
IF NOT EXIST %PLUGIN_BIN%buildevents.exe (
    echo Downloading buildevents from url: https://github.com/%BUILDEVENTS_GH_ORG%/buildevents/releases/download/%BUILDEVENTS_RELEASE%/buildevents-windows-%ARCH%.exe
    curl -Lf -o %PLUGIN_BIN%buildevents.exe https://github.com/%BUILDEVENTS_GH_ORG%/buildevents/releases/download/%BUILDEVENTS_RELEASE%/buildevents-windows-%ARCH%.exe
)

ENDLOCAL
