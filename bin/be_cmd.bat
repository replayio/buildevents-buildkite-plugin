@echo off
SETLOCAL

REM Check if BUILDKITE_TRIGGERED_FROM_BUILD_ID is set and not empty
IF NOT "%BUILDKITE_TRIGGERED_FROM_BUILD_ID%"=="" (
    SET "TRACE_ID=%BUILDKITE_TRIGGERED_FROM_BUILD_ID%"
) ELSE (
    SET "TRACE_ID=%BUILDKITE_BUILD_ID%"
)

REM Set CMD_NAME to the first argument and shift the arguments
SET "CMD_NAME=%1"
SHIFT

REM Shift again to skip the '--' argument (assumed to be the next argument)
SHIFT

REM Concatenate the remaining arguments into CMD
SET "CMD="
:arg_loop
IF "%~1"=="" GOTO end_arg_loop
SET "CMD=%CMD% %1"
SHIFT
GOTO arg_loop
:end_arg_loop

REM Check if BUILDEVENTS is set and not empty
IF "%BUILDEVENTS%"=="" (
    REM Execute the CMD command
    CALL %CMD%
) ELSE (
    REM Execute the buildevents command
    CALL %BUILDEVENTS% cmd %TRACE_ID% %BUILDKITE_STEP_ID% %CMD_NAME% -- %CMD%
)

ENDLOCAL
