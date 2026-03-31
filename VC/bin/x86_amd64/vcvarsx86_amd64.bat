@echo off
set VSINSTALLDIR=%~dp0..\..\..\
set VCINSTALLDIR=%~dp0..\..\..\VC\

if "%VSINSTALLDIR%"=="" goto error_no_VSINSTALLDIR
if "%VCINSTALLDIR%"=="" goto error_no_VCINSTALLDIR

echo Setting environment for using Microsoft Visual Studio 2008 x64 cross tools.

set WindowsSdkDir=%~dp0..\..\..\SDK\

if not "%WindowsSdkDir%"=="" (
    set "PATH=%WindowsSdkDir%Bin;%PATH%"
    set "INCLUDE=%WindowsSdkDir%include;%INCLUDE%"
    set "LIB=%WindowsSdkDir%lib\x64;%LIB%"
)

set DevEnvDir=%~dp0..\..\..\Common7\IDE\
set PATH=%~dp0..\..\..\Common7\IDE;%~dp0..\..\..\VC\BIN\x86_amd64;%~dp0..\..\..\VC\BIN;%~dp0..\..\..\Common7\Tools;%PATH%
set INCLUDE=%~dp0..\..\..\VC\ATLMFC\INCLUDE;%~dp0..\..\..\VC\INCLUDE;%INCLUDE%
set LIB=%~dp0..\..\..\VC\ATLMFC\LIB\amd64;%~dp0..\..\..\VC\LIB\amd64;%LIB%
set LIBPATH=%~dp0..\..\..\VC\ATLMFC\LIB\amd64;%~dp0..\..\..\VC\LIB\amd64;%LIBPATH%

goto end

:error_no_VSINSTALLDIR
echo ERROR: VSINSTALLDIR variable is not set.
goto end

:error_no_VCINSTALLDIR
echo ERROR: VCINSTALLDIR variable is not set.
goto end

:end