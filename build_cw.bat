@echo off

"C:\Program Files\Git\bin\bash.exe" -c "cd /c/github/telegraf_custom/build_qmonitor && ./build_all.sh"

SET "sourceDir=/c/github/telegraf_custom/build_qmonitor"
SET "destDir=C:\github\QuantumMonitor\artifacts"
SET "pattern=telegraf_?.?.?.exe"

FOR /F "delims=" %%F IN ('dir "%sourceDir%\%pattern%" /B /A:-D') DO (
    COPY "%sourceDir%\%%F" "%destDir%\telegraf.exe" /Y
)

CALL "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
powershell -ExecutionPolicy Bypass -File "C:\github\QuantumMonitor\WixSetup\buildmsi.ps1"

