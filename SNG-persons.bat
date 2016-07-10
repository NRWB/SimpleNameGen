:: %~dp0 resolves to the full path of the folder in which the batch script resides.
:: http://stackoverflow.com/questions/13343144/random-line-of-text-ussing-batch

@echo off
setlocal EnableDelayedExpansion
set INPUT_FILE="%~dp0\Storage\Names\persons-data.csv"

%RANDOM%

:: # Count the number of lines in the text file and generate a random number
for /f "usebackq" %%a in (`find /V /C "" ^< %INPUT_FILE%`) do set lines=%%a
set /a randnum=%RANDOM% * lines / 32768 + 1, skiplines=randnum-1

:: # Extract the line from the file
set skip=
if %skiplines% gtr 0 set skip=skip=%skiplines%
for /f "usebackq %skip% delims=" %%a in (%INPUT_FILE%) do set "randline=%%a" & goto continue
:continue

echo Line #%randnum% is:
echo/!randline!

pause
