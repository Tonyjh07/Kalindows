@echo off
title Kalindows
set bin=%cd%
cd ..
set kalindows=%cd%
cd %bin% 
set version=a0.0.5_dev
set github=https://github.com/Tonyjh07/Kalindows
set path=%path%;%bin%;%kalindows%
:init
cd /d %bin%
cls
echo  ##  ##  ####  ##     ###### ##  ## #####   ####  ##   ##  #### 
echo  ## ##  ##  ## ##       ##   ### ## ##  ## ##  ## ##   ## ##    
echo  ####   ###### ##       ##   ## ### ##  ## ##  ## ## # ##  #### 
echo  ## ##  ##  ## ##       ##   ##  ## ##  ## ##  ## #######     ##
echo  ##  ## ##  ## ###### ###### ##  ## #####   ####   ## ##   #### 
echo  Version:%version%
echo  Github:%gitHub%
echo  警告：Kalindows正处于Alpha内测阶段，请勿在生产环境中使用！
echo  您正处于开发者模式，输入debug查看调试信息。


:command
set command=
echo=
echo %cd%
set /p command=Kalindows＞
if "%command%"=="exit" (echo bye!&exit)
if "%command%"=="init" (@goto init)
call %command%
@goto command