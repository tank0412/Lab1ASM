@echo off

if exist %1.obj del %l1.obj

if exist %1.exe del %l1.exe

ml /c %l1.asm

if errorlevel 1 goto errasm

Link16 %l1.obj;

if errorlevel 1 goto errlink

goto TheEnd

:errlink

echo _

echo Link error

goto TheEnd

:errasm

echo _

echo Assembly Error

goto TheEnd

:TheEnd

pause