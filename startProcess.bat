@ECHO OFF

mkdir WinPrankXP
cd WinPrankXP

echo @ECHO OFF > playSounds.txt
echo powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Startup.wav' -OutFile startup.wav" >> playSounds.txt
echo powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Critical Stop.wav' -OutFile error.wav" >> playSounds.txt
echo powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Shutdown.wav' -OutFile shutdown.wav" >> playSounds.txt
echo :loop >> playSounds.txt
echo set /a num = %%random%% %%%%100 +10 >> playSounds.txt
echo set /a num2 = %%random%% %%%%100 +10 >> playSounds.txt
echo timeout -t %%num%% /nobreak >nul >> playSounds.txt
echo powershell -c (New-Object Media.SoundPlayer 'startup.wav').PlaySync(); >> playSounds.txt
echo timeout -t %%num2%% /nobreak >nul >> playSounds.txt
echo powershell -c (New-Object Media.SoundPlayer 'error.wav').PlaySync(); >> playSounds.txt
echo powershell -c (New-Object Media.SoundPlayer 'shutdown.wav').PlaySync(); >> playSounds.txt
echo goto loop >> playSounds.txt

echo Set WshShell = CreateObject('WScript.Shell') > runInvisible.txt
echo "WshShell.Run chr(34) & 'playSounds.bat' & Chr(34), 0" >> runInvisible.txt
echo Set WshShell = Nothing >> runInvisible.txt
@REM start runInvisible.vbs

@REM cd ..
for /F "tokens=*" %%A in (.\runInvisible.txt) do (
    IF %%A=="e" (
        echo %%A >> out.txt
    )
) 

@REM move startProcess.bat WinPrankXP