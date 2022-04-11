@echo off

set vcvarsall="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat"
SET arch="%1"

IF "%1"=="" GOTO usage
IF "%1"=="x64" GOTO init_vcvarsall
IF "%1"=="x86" GOTO init_vcvarsall
GOTO usage

:init_vcvarsall
IF "%1"=="x64" call %vcvarsall% x64
IF "%1"=="x86" call %vcvarsall% x86

:compile
rc /r /fo outres.res rds.rc
REM cl main.c outres.res /Fe:jittey.exe /link /LIBPATH:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.18362.0\um\x86\" User32.Lib Gdi32.Lib Comdlg32.Lib Comctl32.Lib Advapi32.Lib Shell32.Lib
cl main.c outres.res /Fe:jittey.exe /link User32.Lib Gdi32.Lib Comdlg32.Lib Comctl32.Lib Advapi32.Lib Shell32.Lib
GOTO :eof

:usage
echo "Arch is required (x86|x64)"