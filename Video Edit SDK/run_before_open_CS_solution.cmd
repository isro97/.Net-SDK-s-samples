@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------



cd WinForms

cd CSharp

del /S /Q "Main Demo\bin\*"
del /S /Q "Main Demo\obj\*"
del /S /Q "Main Demo\obj_netcore\*"

del /S /Q "Video from images\bin\*"
del /S /Q "Video from images\obj\*"
del /S /Q "Video from images\obj_netcore\*"

del /S /Q "Video from images in memory\bin\*"
del /S /Q "Video from images in memory\obj\*"
del /S /Q "Video from images in memory\obj_netcore\*"

del /S /Q "Video Join Demo\bin\*"
del /S /Q "Video Join Demo\obj\*"
del /S /Q "Video Join Demo\obj_netcore\*"

cd ..

cd ..

