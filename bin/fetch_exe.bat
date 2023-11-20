@echo off
SETLOCAL

SET "BUILDEVENTS_GH_ORG=replayio"
SET "BUILDEVENTS_RELEASE=toshok%2Fadd-buildkite-watch-v0.2"

SET "PLUGIN_BIN=%~dp0"

:: Download buildevents if not exists
IF NOT EXIST "%PLUGIN_BIN%buildevents.exe" (
    curl -Lf -o "%PLUGIN_BIN%buildevents.exe" "https://github.com/%BUILDEVENTS_GH_ORG%/buildevents/releases/download/%BUILDEVENTS_RELEASE%/buildevents-windows-%ARCH%.exe"
)

ENDLOCAL
