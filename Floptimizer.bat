@echo off
title Floptimizer - Windows Optimizer (By xf1op)
:: color for background and text
color 1f
:: color change for text
echo [38;2;0;255;255m
mode 63,15
echo.
:: (Made By xf1op or Floppi, 1st nickname 2nd display name you can call me with)
echo ---                         WELCOME        (Made By Floppi) ---
echo.
echo --- The script you will be using is safe and half-automated ---
echo.
echo ---   Most of the commands used are made from scratch or    ---
echo ---   made from videos to execute in script from youtubers  ---
echo ---    FrameSync Labs, credits to him and other people!     ---
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
echo - [4] Windows Settings
echo - [5] Other Tweaks
echo - [6] Informations/Explanatory
echo.
echo - [0] Exit
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto no
if '%q%'=='2' cls && goto lf
if '%q%'=='3' cls && goto gt
if '%q%'=='4' cls && goto ws
if '%q%'=='5' cls && goto ot
if '%q%'=='6' cls && goto in
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

:n1
:: Disables everything except ipv4 (internet connection) and Quality-of-Service packet scheduler (control panel -> network -> view network status -> change adapter settings -> double-click any and click properties)
powershell -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_msclient'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_implat'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip6'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_server'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_rspndr'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lldp'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lltdio'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_pacer'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip'; }"
echo Disabled unnecessary network adapter settings!  Returning.. && timeout 2 >nul && goto no

:n2
:: Self explanatory (network auto-tuning disabled)
Netsh int tcp set global autotuning=disabled >nul
echo Disabled!  Returning.. && timeout 2 >nul && goto no

:n3
:: UDP datagram optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t REG_DWORD /d 0x00064000 /f >nul
echo Enhanced UDP connection!  Returning.. && timeout 2 >nul && goto no

:n4
:: Network throttling index set to maximum value
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul
echo Throttling disabled!  Returning.. && timeout 2 >nul && goto no

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
echo - [2] Enhance Power Plan Settings
echo - [3] Disable High Precision Event Timer (AMD recommended)
echo.
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

:l1
:: Disable Human interface device service (not recommended for keyboards with many multimedia buttons but improved input lag/less latency)
sc config "hidserv" start=disabled
sc stop "hidserv"
cls
echo Disabled!  Returning.. && timeout 2 >nul && goto lf

:l2
:: Fixes latency by setting power plan idle demote/promote to 100% within "core parking minimum cores" AND increases performance by disabling link state power management (off)
for /f "tokens=3" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /v ActivePowerScheme') do set app=%%i
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100 >nul
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 4b92d758-5a24-4851-a470-815d78aee119 100 >nul
powercfg -setacvalueindex %app% 54533251-82be-4824-96c1-47b60b740d00 7b224883-b3cc-4d79-819f-8374152cbe7c 100 >nul
powercfg -setacvalueindex %app% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0 >nul
echo Enhanced power plan!  Returning.. && timeout 2 >nul && goto lf

:l3
:: Disable HPET (proven to decrease latency and improve fps at some point, mostly 1% low are better but also average fps)
powershell -command "Get-PnpDevice -FriendlyName 'High Precision Event Timer' | Disable-PnpDevice -Confirm:$false"
bcdedit /set useplatformclock no >nul
echo Disabled!  Returning.. && timeout 2 >nul && goto lf

:: Gaming tweaks
:gt
cls
set q=
echo.
echo ---                      Gaming Tweaks                      ---
echo - Increased gaming performance
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Disable Game Mode
echo - [2] Disable Hardware Accelerated GPU Scheduling
echo - [3] Disable Game DVR
echo - [4] Maximize Performance Of Priority Separation
echo - [5] Reduce Low Priority Task CPU Usage
echo.
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

:g1
:: Disable Game Mode in system (improves frames when disabled)
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 0 /f >nul
echo Disabled!  Returning.. && timeout 2 >nul && goto gt

:g2
:: Disable hardware accelerated gpu scheduling (gpu isnt used for system tasks)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 1 /f >nul
echo Disabled!  Returning.. && timeout 2 >nul && goto gt

:g3
:: Disable Game DVR (some needless game recording thing)
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo Disabled!  Returning.. && timeout 2 >nul && goto gt

:g4
:: Change priority separation (very important value <36>, best for games, default 2 or 38 on windows 11 which is bad if its 2)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 36 /f >nul
echo Maximized foreground priority!  Returning.. && timeout 2 >nul && goto gt

:g5
:: Change percentage of CPU resources that should be guaranteed to low-priority tasks (14 default, 10 minimum, set 1 to make sure its low)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 1 /f >nul
echo Reduced!  Returning.. && timeout 2 >nul && goto gt

::Windows Settings
:ws
echo Still working on it!
timeout 2 >nul
goto menu

::Other Tweaks
:ot
cls
set q=
echo.
echo ---                      Other  Tweaks                      ---
echo - Other probably important tweaks
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Disable Unnecessary Services
echo - [2] Remove Common Unused Microsoft Apps
echo.
echo.
echo.
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto o1
if '%q%'=='2' cls && goto o2
if not '%q%'=='0' cls && goto ot
goto menu

:o1
sc config "AppVClient" start=disabled
sc config "CDPSvc" start=disabled
sc config "CDPUserSvc" start=disabled
sc config "CDPUserSvc" start=disabled
sc config "DispBrokerDesktopSvc" start=disabled
sc config "DPS" start=disabled
sc config "edgeupdate" start=disabled
sc config "edgeupdatem" start=disabled
sc config "FontCache" start=disabled
sc config "hidserv" start=disabled
sc config "iphlpsvc" start=disabled
sc config "LanmanServer" start=disabled
sc config "LanmanWorkstation" start=disabled
sc config "lfsvc" start=disabled
sc config "lmhosts" start=disabled
sc config "MessagingService" start=disabled
sc config "MicrosoftEdgeElevationService" start=disabled
sc config "Netlogon" start=disabled
sc config "NetTcpPortSharing" start=disabled
sc config "OneSyncSvc" start=disabled
sc config "PcaSvc" start=disabled
sc config "PimIndexMaintenanceSvc" start=disabled
sc config "QWAVE" start=disabled
sc config "RemoteAccess" start=disabled
sc config "RemoteRegistry" start=disabled
sc config "RmSvc" start=disabled
sc config "SCardSvr" start=disabled
sc config "ScDeviceEnum" start=disabled
sc config "SCPolicySvc" start=disabled
sc config "SENS" start=disabled
sc config "ShellHWDetection" start=disabled
sc config "SSDPSRV" start=disabled
sc config "ssh-agent" start=disabled
sc config "SysMain" start=disabled
sc config "Themes" start=disabled
sc config "TrkWks" start=disabled
sc config "tzautoupdate" start=disabled
sc config "UevAgentService" start=disabled
sc config "UnistoreSvc" start=disabled
sc config "UserDataSvc" start=disabled
sc config "WpnService" start=disabled
sc config "WpnUserService" start=disabled
sc config "WSAIFabricSvc" start=disabled
sc config "WSearch" start=disabled
sc config "WerSvc" start=disabled
cls
echo Disabled services!  Returning.. && timeout 2 >nul && goto ot
:o2
cls
echo Still working on this!
echo Removing Cortana, phone link, other things later... (just listed what will be removed it didnt do anything)
timeout 2 >nul
echo Removed apps (fake)!  Returning.. && timeout 2 >nul && goto ot

:: Credits to FrameSync Labs for giving good precised benchmarks and optimization videos i took inspiration from https://www.youtube.com/@FrameSyncLabs

:in
mode 90,15
cls
echo.
echo ---                                    Informations                                    ---
echo.
echo - To revert any changed service in system, you can check my github for default settings.
echo   github.com/xf1op/Floptimizer/blob/main/def-services.md  (select ^& right click to copy)
echo.
echo - Explanations and other information can be found in another file on my github page.
echo   github.com/xf1op/Floptimizer/blob/main/explanations.md  (select ^& right click to copy)
echo.
pause
mode 63,15
goto menu
