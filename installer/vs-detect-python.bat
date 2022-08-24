@echo off

IF EXIST "Python311.dll" (
    ECHO Python 3.11 detected
    GOTO end
)

ECHO Python 3.11 is supported
GOTO end

:end
pause