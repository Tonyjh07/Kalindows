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
echo  ���棺Kalindows������Alpha�ڲ�׶Σ�����������������ʹ�ã�
echo  �������ڿ�����ģʽ������debug�鿴������Ϣ��


:command
set command=
echo=
echo %cd%
set /p command=Kalindows��
if "%command%"=="exit" (echo bye!&exit)
if "%command%"=="init" (@goto init)
call %command%
@goto command