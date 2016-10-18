REM much potatoe
@echo off
setlocal EnableDelayedExpansion 
echo Fill
echo "Starting at C drive. Enter all directory commands, seperate all commands with && or ||"
set /p cdcmd=
%cdcmd%
echo %cd% is your current directory

echo Spawn thread number? 0 means only this thread.
set /p threads=
if %threads% lss 1 goto :passthread
echo cd %cd% > %~dp0\threads.bat
echo :loop >> %~dp0\threads.bat
echo @echo on >> %~dp0\threads.bat
echo echo %%random%%%%random%%%%random%% ^>^> "landfill\%%random%%%%random%%%%random%%%%random%%%%random%%.txt" >> %~dp0\threads.bat
echo @echo off >> %~dp0\threads.bat
echo goto :loop >> %~dp0\threads.bat
:passthread


echo Press any key to fill...
pause > nul
mkdir landfill
set count=1

for /l %%G in (1, 1, %threads%) do ping localhost ^/n 1 && start %~dp0\threads.bat

:loop
@echo on
echo %random%%random%%random% >> "landfill\%random%%random%%random%%random%%random%.txt"
@echo off
goto :loop
