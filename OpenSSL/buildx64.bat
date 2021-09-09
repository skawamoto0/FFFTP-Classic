@echo off
pushd %~dp0
set var0=VC-WIN64A
set var1=..\dist\amd64
rem Use compat51.bat to support Windows XP or later.
rem Use compat50.bat to support Windows 2000.
call compat51.bat
perl nodebug.pl
nmake /f makefile build_libs
copy /y libcrypto-3-x64.dll %var1%\libcrypto-3-x64.dll
copy /y libssl-3-x64.dll %var1%\libssl-3-x64.dll
popd
exit /b
