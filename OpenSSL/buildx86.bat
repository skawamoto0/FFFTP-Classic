@echo off
pushd %~dp0
set var0=VC-WIN32
set var1=..\dist
rem Use compat51.bat to support Windows XP or later.
rem Use compat50.bat to support Windows 2000.
call compat50.bat
perl nodebug.pl
nmake /f makefile build_libs
copy /y libcrypto-3.dll %var1%\libcrypto-3.dll
copy /y libssl-3.dll %var1%\libssl-3.dll
popd
exit /b
