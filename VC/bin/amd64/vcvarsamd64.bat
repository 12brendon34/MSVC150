@echo off
set VSINSTALLDIR=%~dp0..\..\..\
set VCINSTALLDIR=%~dp0..\..\..\VC\

if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

echo Setting environment for using Microsoft Visual Studio 2008 x64 tools.

set WindowsSdkDir=%~dp0..\..\..\SDK\

if not "%WindowsSdkDir%"=="" (
    set "PATH=%WindowsSdkDir%Bin\x64;%WindowsSdkDir%Bin\win64\x64;%WindowsSdkDir%Bin;%PATH%"
    set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
    set "LIB=%WindowsSdkDir%lib\x64;%LIB%"
)

set PATH=%VCINSTALLDIR%BIN\amd64;%VSINSTALLDIR%Common7\IDE;%VSINSTALLDIR%Common7\Tools;%VSINSTALLDIR%Common7\Tools\bin;%PATH%
set INCLUDE=%VCINSTALLDIR%ATLMFC\INCLUDE;%VCINSTALLDIR%INCLUDE;%INCLUDE%
set LIB=%VCINSTALLDIR%ATLMFC\LIB\amd64;%VCINSTALLDIR%LIB\amd64;%LIB%
set LIBPATH=%VCINSTALLDIR%ATLMFC\LIB\amd64;%VCINSTALLDIR%LIB\amd64;%LIBPATH%

goto end

:error_no_VSINSTALLDIR
echo ERROR: VSINSTALLDIR variable is not set.
goto end

:error_no_VCINSTALLDIR
echo ERROR: VCINSTALLDIR variable is not set.
goto end

:end