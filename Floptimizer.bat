@echo off
title Floptimizer - Windows Optimizer (By xf1op)
:: color for background and text
color 1f
:: color change for text
echo [38;2;0;255;255m
mode 63,14
echo.
:: (Made By xf1op or Floppi, 1st nickname 2nd display name you can call me with)
echo ---                         WELCOME        (Made By Floppi) ---
echo.
echo --- The script you will be using is safe and half-automated ---
echo.
echo ---   Most of the commands used are made from scratch or-   ---
echo ---  -made from videos to execute in script from youtuber-  ---
echo ---    -FrameSync Labs, credits to him and other people!    ---
echo.
echo ---  Everything in the script is pointed out what it does!  ---
echo --- NO MALWARE INSIDE (right-click and edit to see content) ---
echo.
echo - Press Enter To Continue! (With Administrator Permissions)
:: Administrator permissions
net session >nul 2>&1
if %errorLevel% == 0 (
    :: literally nothing
    nul
) else (
    if not "%1"=="runAsAdmin" (
        pause >nul
        :: Runs admin permissions
        powershell -Command "Start-Process '%~0' -ArgumentList 'runAsAdmin' -Verb RunAs"
        exit /b
    )
)
:: menu to select stuff
:menu
cls
set q=
echo.
echo ---                        Main Page                        ---
echo.
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Network Optimization
echo - [2] Latency Fixes
echo - [3] Gaming Tweaks
echo - [4] Windows Settings - WIP
echo - [5] Other Tweaks - WIP
echo.
echo - [0] Exit
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto no
if '%q%'=='2' cls && goto lf
if '%q%'=='3' cls && goto gt
if not '%q%'=='0' cls && goto menu
exit

:: Network optimization
:no
cls
set q=
echo.
echo ---                  Network  Optimization                  ---
echo - Improved internet connection
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Enabled Network Adapters Tweaks
echo - [2] Turn Off Network Auto-Tuning
echo - [3] Enhance UDP Connection
echo - [4] Disable Network Throttling Index
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto n1
if '%q%'=='2' cls && goto n2
if '%q%'=='3' cls && goto n3
if '%q%'=='4' cls && goto n4
if not '%q%'=='0' cls && goto no
goto menu

:: Latency fixes
:lf
cls
set q=
echo.
echo ---                      Latency Fixes                      ---
echo - Less input lag or latency between actions (mouse move, etc)
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Disable HID service
echo - [2] Fix Power Plan Latency
echo - [3] Disable High Precision Event Timer (AMD recommended)
echo.
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto l1
if '%q%'=='2' cls && goto l2
if '%q%'=='3' cls && goto l3
if not '%q%'=='0' cls && goto lf
goto menu

:: Gaming tweaks
:gt
cls
set q=
echo.
echo ---                      Latency Fixes                      ---
echo - Increased gaming performance
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Disable Game Mode
echo - [2] Disable Hardware Accelerated GPU Scheduling
echo - [3] Disable Game DVR
echo - [4] Maximize Performance Of Priority Separation
echo - [5] Reduce Low Priority Task CPU Usage
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto g1
if '%q%'=='2' cls && goto g2
if '%q%'=='3' cls && goto g3
if '%q%'=='4' cls && goto g4
if '%q%'=='5' cls && goto g5
if not '%q%'=='0' cls && goto gt
goto menu

:n1
:: Disables everything except ipv4 (internet connection) and Quality-of-Service packet scheduler (control panel -> network -> view network status -> change adapter settings -> double-click any and click properties)
powershell -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_msclient'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_implat'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip6'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_server'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_rspndr'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lldp'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lltdio'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_pacer'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip'; }"
echo Finished!  Returning.. && timeout 2 >nul && goto no

:n2
:: Self explanatory (network auto-tuning disabled)
Netsh int tcp set global autotuning=disabled >nul
echo Finished!  Returning.. && timeout 2 >nul && goto no

:n3
:: UDP datagram optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 0x00064000 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto no

:n4
:: Network throttling index set to maximum value
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto no

:l1
:: Disable Human interface device service (not recommended for keyboards with many multimedia buttons but improved input lag/less latency)
sc config "hidserv" start=disabled
sc stop "hidserv"
echo Finished!  Returning.. && timeout 2 >nul && goto lf

:l2
:: Fixes latency by setting power plan idle demote/promote to 100% within "core parking minimum cores"
for /f "tokens=3" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /v ActivePowerScheme') do set app=%%i
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100 >nul
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 4b92d758-5a24-4851-a470-815d78aee119 100 >nul
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 7b224883-b3cc-4d79-819f-8374152cbe7c 100 >nul
echo Finished!  Returning.. && timeout 2 >nul && goto lf

:l3
:: Disable HPET (proven to decrease latency and improve fps at some point, mostly 1% low are better but also average fps)
powershell -command "Get-PnpDevice -FriendlyName 'High Precision Event Timer' | Disable-PnpDevice -Confirm:$false"
bcdedit /set useplatformclock no >nul
bcdedit /deletevalue useplatformclock >nul
echo Finished!  Returning.. && timeout 2 >nul && goto lf

:g1
:: Disable Game Mode in system (improves frames when disabled)
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto gt

:g2
:: Disable hardware accelerated gpu scheduling (gpu isnt used for system tasks)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 1 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto gt

:g3
:: Disable Game DVR (some needless game recording thing)
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto gt

:g4
:: Change priority separation (very important value <36>, best for games, default 2 or 38 on windows 11 which is bad if its 2)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 36 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto gt

:g5
:: Change percentage of CPU resources that should be guaranteed to low-priority tasks (14 default, 10 minimum, set 1 to make sure its low)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 1 /f >nul
echo Finished!  Returning.. && timeout 2 >nul && goto gt

:: Credits to FrameSync Labs for giving good precised benchmarks and optimization videos https://www.youtube.com/@FrameSyncLabs
