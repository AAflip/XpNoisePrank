@ECHO OFF

powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Startup.wav' -OutFile startup.wav"
powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Critical Stop.wav' -OutFile error.wav"
powershell -Command "Invoke-WebRequest 'https://archive.org/download/windowsxpstartup_201910/Windows XP Shutdown.wav' -OutFile shutdown.wav"

:loop
set /a num = %random% %%100 +10
set /a num2 = %random% %%100 +10

timeout -t %num% /nobreak >nul
powershell -c (New-Object Media.SoundPlayer 'startup.wav').PlaySync();
timeout -t %num2% /nobreak >nul
powershell -c (New-Object Media.SoundPlayer 'error.wav').PlaySync();
powershell -c (New-Object Media.SoundPlayer 'shutdown.wav').PlaySync();

goto loop