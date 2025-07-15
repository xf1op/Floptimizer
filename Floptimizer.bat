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
:: Disables everything except ipv4 (internet connection) and Quality-of-Service packet scheduler and sets ipv4 dns to cloudflare (control panel -> network -> view network status -> change adapter settings -> double-click any and click properties)
powershell -Command "Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { Set-DnsClientServerAddress -InterfaceAlias $_.Name -ServerAddresses 8.8.8.8, 8.8.4.4; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_msclient'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_implat'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip6'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_server'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_rspndr'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lldp'; Disable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_lltdio'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_pacer'; Enable-NetAdapterBinding -Name $_.Name -ComponentID 'ms_tcpip'; }"
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
echo - [4] Disable Every USB Power Saving State
echo.
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto l1
if '%q%'=='2' cls && goto l2
if '%q%'=='3' cls && goto l3
if '%q%'=='4' cls && goto l4
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

:l4
:: Disables all power saving states from USB and other devices in device manager
powershell -NoProfile -command "$devicesUSB = Get-PnpDevice | where {$_.InstanceId -like \"*USB\ROOT*\"} | ForEach-Object -Process { Get-CimInstance -ClassName MSPower_DeviceEnable -Namespace root\wmi }; foreach ( $device in $devicesUSB ) {Set-CimInstance -Namespace root\wmi -Query \"SELECT * FROM MSPower_DeviceEnable WHERE InstanceName LIKE '%%$($device.PNPDeviceID)%%'\" -Property @{Enable=$False} -PassThru}"
echo Disabled power saving states!  Returning.. && timeout 2 >nul && goto lf

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
cls
set q=
echo.
echo ---                    Windows  Settings                    ---
echo - Change windows system settings
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Change Windows Dark/Light Mode
echo - [2] Change Windows Transparency/Animations
echo - [3] Open Windows Performance Options
echo.
echo.
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto w1
if '%q%'=='2' cls && goto w2
if '%q%'=='3' cls && goto w3
if not '%q%'=='0' cls && goto ws
goto menu

:w1
set q=
echo.
echo In windows 10 and 11 theres only dark or light theme.
echo.
echo Would you like to change the theme into dark or light mode?
echo.
echo - [1] Dark Theme
echo - [2] Light Theme
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto dt
if '%q%'=='2' cls && goto lt
if not '%q%'=='0' cls && goto w1
goto ws

:dt
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f >nul
echo.
echo Changed the theme!
timeout 1 >nul
echo Restart for better result!!
timeout 2 >nul
goto ws

:lt
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f >nul
echo.
echo Changed the theme!
timeout 1 >nul
echo Restart for better result!!
timeout 2 >nul
goto ws

:w2
echo.
echo Opening windows settings..
timeout 1 >nul
start ms-settings:easeofaccess-visualeffects
goto ws

:w3
echo.
echo Opening windows performance options..
timeout 1 >nul
echo.
echo Change it to best performance and apply!
echo Next go to advanced and set virtual memory on C drive and
echo set it to initial 16 and maximum 8192, set, ok ^& restart!
timeout 2 >nul
%windir%\system32\SystemPropertiesPerformance.exe
goto ws
::Other Tweaks
:ot
mode 63,15
cls
set q=
echo.
echo ---                      Other  Tweaks                      ---
echo - Other probably important tweaks
echo ---       Pick your number from the list to continue!       ---
echo.
echo - [1] Disable Unnecessary Services
echo - [2] Remove Common Microsoft Bloatware Apps
echo - [3] Pause And Disable Automatic Windows Updates
echo.
echo.
echo.
echo.
echo - [0] Return
echo.
set /p q=- Number: 
if '%q%'=='1' cls && goto o1
if '%q%'=='2' cls && goto o2
if '%q%'=='3' cls && goto o3
if not '%q%'=='0' cls && goto ot
goto menu

:o1
:: Disables not really needed system services AND background windows apps.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
sc config "AppVClient" start=disabled 2>nul >nul
echo Disabled Microsoft App-V Client
sc stop "AppVClient" 2>nul >nul
sc config "CDPSvc" start=disabled 2>nul >nul
echo Disabled Connected Devices Platform Service
sc stop "CDPSvc" 2>nul >nul
sc config "CDPUserSvc" start=disabled 2>nul >nul
echo Disabled Connected Devices Platform User Service
sc stop "CDPUserSvc" 2>nul >nul
sc config "DPS" start=disabled 2>nul >nul
echo Disabled Diagnostic Policy Service
sc stop "DPS" 2>nul >nul
sc config "DispBrokerDesktopSvc" start=disabled 2>nul >nul
echo Disabled Display Enhancement Service
sc stop "DispBrokerDesktopSvc" 2>nul >nul
sc config "FontCache" start=disabled 2>nul >nul
echo Disabled Windows Font Cache Service
sc stop "FontCache" 2>nul >nul
sc config "iphlpsvc" start=disabled 2>nul >nul
echo Disabled IP Helper
sc stop "iphlpsvc" 2>nul >nul
sc config "LanmanServer" start=disabled 2>nul >nul
echo Disabled Server
sc stop "LanmanServer" 2>nul >nul
sc config "LanmanWorkstation" start=disabled 2>nul >nul
echo Disabled Workstation
sc stop "LanmanWorkstation" 2>nul >nul
sc config "lfsvc" start=disabled 2>nul >nul
echo Disabled Geolocation Service
sc stop "lfsvc" 2>nul >nul
sc config "lmhosts" start=disabled 2>nul >nul
echo Disabled TCP/IP NetBIOS Helper
sc stop "lmhosts" 2>nul >nul
sc config "MessagingService" start=disabled 2>nul >nul
echo Disabled Messaging Service
sc stop "MessagingService" 2>nul >nul
sc config "MicrosoftEdgeElevationService" start=disabled 2>nul >nul
echo Disabled Microsoft Edge Elevation Service
sc stop "MicrosoftEdgeElevationService" 2>nul >nul
sc config "Netlogon" start=disabled 2>nul >nul
echo Disabled Netlogon
sc stop "Netlogon" 2>nul >nul
timeout 1 >nul
sc config "NetTcpPortSharing" start=disabled 2>nul >nul
echo Disabled Net.Tcp Port Sharing Service
sc stop "NetTcpPortSharing" 2>nul >nul
sc config "OneSyncSvc" start=disabled 2>nul >nul
echo Disabled Sync Host
sc stop "OneSyncSvc" 2>nul >nul
sc config "PcaSvc" start=disabled 2>nul >nul
echo Disabled Program Compatibility Assistant Service
sc stop "PcaSvc" 2>nul >nul
sc config "PimIndexMaintenanceSvc" start=disabled 2>nul >nul
echo Disabled Contact Data
sc stop "PimIndexMaintenanceSvc" 2>nul >nul
sc config "QWAVE" start=disabled 2>nul >nul
echo Disabled Quality Windows Audio Video Experience
sc stop "QWAVE" 2>nul >nul
sc config "RemoteAccess" start=disabled 2>nul >nul
echo Disabled Routing and Remote Access
sc stop "RemoteAccess" 2>nul >nul
sc config "RemoteRegistry" start=disabled 2>nul >nul
echo Disabled Remote Registry
sc stop "RemoteRegistry" 2>nul >nul
sc config "RmSvc" start=disabled 2>nul >nul
echo Disabled Windows Modern Standby Network Connectivity
sc stop "RmSvc" 2>nul >nul
sc config "SCardSvr" start=disabled 2>nul >nul
echo Disabled Smart Card
sc stop "SCardSvr" 2>nul >nul
sc config "SCPolicySvc" start=disabled 2>nul >nul
echo Disabled Smart Card Removal Policy
sc stop "SCPolicySvc" 2>nul >nul
sc config "ScDeviceEnum" start=disabled 2>nul >nul
echo Disabled Smart Card Device Enumeration Service
sc stop "ScDeviceEnum" 2>nul >nul
sc config "SENS" start=disabled 2>nul >nul
echo Disabled System Event Notification Service
sc stop "SENS" 2>nul >nul
sc config "ShellHWDetection" start=disabled 2>nul >nul
echo Disabled Shell Hardware Detection
sc stop "ShellHWDetection" 2>nul >nul
sc config "SSDPSRV" start=disabled 2>nul >nul
echo Disabled SSDP Discovery
sc stop "SSDPSRV" 2>nul >nul
timeout 1 >nul
sc config "SysMain" start=disabled 2>nul >nul
echo Disabled SysMain
sc stop "SysMain" 2>nul >nul
sc config "Themes" start=disabled 2>nul >nul
echo Disabled Themes
sc stop "Themes" 2>nul >nul
sc config "TrkWks" start=disabled 2>nul >nul
echo Disabled Distributed Link Tracking Client
sc stop "TrkWks" 2>nul >nul
sc config "tzautoupdate" start=disabled 2>nul >nul
echo Disabled Auto Time Zone Updater
sc stop "tzautoupdate" 2>nul >nul
sc config "UevAgentService" start=disabled 2>nul >nul
echo Disabled User Experience Virtualization Service
sc stop "UevAgentService" 2>nul >nul
sc config "UnistoreSvc" start=disabled 2>nul >nul
echo Disabled User Data Storage
sc stop "UnistoreSvc" 2>nul >nul
sc config "UserDataSvc" start=disabled 2>nul >nul
echo Disabled User Data Access
sc stop "UserDataSvc" 2>nul >nul
sc config "WpnService" start=disabled 2>nul >nul
echo Disabled Windows Push Notifications System Service
sc stop "WpnService" 2>nul >nul
sc config "WpnUserService" start=disabled 2>nul >nul
echo Disabled Windows Push Notifications User Service
sc stop "WpnUserService" 2>nul >nul
sc config "WerSvc" start=disabled 2>nul >nul
echo Disabled Windows Error Reporting Service
sc stop "WerSvc" 2>nul >nul
sc config "WSearch" start=disabled 2>nul >nul
echo Disabled Windows Search
sc stop "WSearch" 2>nul >nul
sc config "WSAIFabricSvc" start=disabled 2>nul >nul
echo Disabled Windows Advanced Infrastructure Fabric Service
sc stop "WSAIFabricSvc" 2>nul >nul
sc config "StiSvc" start=disabled 2>nul >nul
echo Disabled Windows Image Acquisition Service
sc stop "StiSvc" 2>nul >nul
sc config "TapiSrv" start=disabled 2>nul >nul
echo Disabled Telephony Service
sc stop "TapiSrv" 2>nul >nul
timeout 1 >nul
sc config "WiaRpc" start=disabled 2>nul >nul
echo Disabled Still Image Acquisition Events Service
sc stop "WiaRpc" 2>nul >nul
sc config "Spooler" start=demand 2>nul >nul
echo Disabled Print Spooler Service
sc stop "Spooler" 2>nul >nul
sc config "PrintWorkflowUserSvc" start=disabled 2>nul >nul
echo Disabled Print Workflow Service
sc stop "PrintWorkflowUserSvc" 2>nul >nul
sc config "BcastDVRUserService" start=disabled 2>nul >nul
echo Disabled GameDVR and Broadcast User Service
sc stop "BcastDVRUserService" 2>nul >nul
sc config "DevicePickerUserSvc" start=disabled 2>nul >nul
echo Disabled Device Picker Service
sc stop "DevicePickerUserSvc" 2>nul >nul
sc config "workfolderssvc" start=disabled 2>nul >nul
echo Disabled Work Folders Service
sc stop "workfolderssvc" 2>nul >nul
sc config "icssvc" start=disabled 2>nul >nul
echo Disabled Windows Mobile Hotspot Service
sc stop "icssvc" 2>nul >nul
sc config "wisvc" start=disabled 2>nul >nul
echo Disabled Windows Insider Service
sc stop "wisvc" 2>nul >nul
echo Disabled unnecessary services!  Returning.. && timeout 2 >nul && goto ot

:o2
:: Removes Cortana, News, Phone Link, 3D Viewer, Paint 3D, Voice Recorder, Weather, Mixed Reality Portal, Get Help, Get Started, OneNote, Feedback Hub, Alarms, Mail and Calendar and Maps
mode 80,20
cls
echo Do you want to continue?
echo.
echo This will remove apps like - Cortana, News, Phone Link, 3D Viewer, Paint 3D, 
echo Voice Recorder, Weather, Mixed Reality Portal, Get Help, Get Started, OneNote,
echo Feedback Hub, Alarms, Mail and Calendar and Maps.
echo.
echo.
set /p q=Continue? [y/n] : 
if '%q%'=='n' cls &&  goto ot
if not '%q%'=='y' cls && goto o2
cls
echo Removing microsoft apps...
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "@('Microsoft.549981C3F5F10','Microsoft.BingNews','Microsoft.YourPhone','Microsoft.Microsoft3DViewer','Microsoft.MSPaint','Microsoft.Getstarted','Microsoft.WindowsSoundRecorder','Microsoft.BingWeather','Microsoft.Windows.HolographicFirstRun','Microsoft.GetHelp','Microsoft.Office.OneNote','Microsoft.WindowsFeedbackHub','Microsoft.WindowsAlarms','microsoft.windowscommunicationsapps','Microsoft.WindowsMaps') | ForEach-Object { $pkg = Get-AppxPackage $_; if ($pkg) { Write-Host ('Removing: ' + $pkg.Name + ' (' + $pkg.PackageFullName + ')'); Remove-AppxPackage $pkg } else { Write-Host ('Not installed: ' + $_) } }"
echo.
echo Removed common bloatware apps!  Returning.. && timeout 2 >nul && goto ot

:o3
:: Pauses automatic updates and windows apps auto updates, next time unpausing windows update will cause updates to notify but not download and install without interaction.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v PauseFeatureUpdatesStartTime /t REG_SZ /d "2025-01-01T20:00:00Z" /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v PauseQualityUpdatesStartTime /t REG_SZ /d "2025-01-01T20:00:00Z" /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v PauseFeatureUpdatesEndTime /t REG_SZ /d "2099-01-01T20:00:00Z" /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v PauseQualityUpdatesEndTime /t REG_SZ /d "2099-01-01T20:00:00Z" /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v PauseUpdatesExpiryTime /t REG_SZ /d "2099-01-01T20:00:00Z" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v AutoDownload /t REG_DWORD /d 2 /f
sc config UsoSvc start=demand
sc stop UsoSvc
sc stop wuauserv
cls
echo Paused and disabled automatic windows updates!  Returning.. && timeout 2 >nul && goto ot

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
echo.
echo.
pause
mode 63,15
goto menu

:: Credits to FrameSync Labs for giving good precised benchmarks and optimization videos i took inspiration from https://www.youtube.com/@FrameSyncLabs.
