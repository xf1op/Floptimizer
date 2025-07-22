## Change services by pressing ⊞(windows) + R and writing services.msc into the window
<img width="395" height="202" alt="image" src="https://github.com/user-attachments/assets/9fd4800a-c3da-4900-a71c-bb15ad401281" />

### All services here are DEFAULT in windows (some arent), if you need to reset them, take this list for yourself and fix problems.
Description was made by AI. I'm too lazy to make it, though i added what's safe to disable.
| Service Display Name | Startup Type | Description |
|-|-|-|
| ActiveX Installer (AxInstSV) | Manual | Provides User Account Control (UAC) validation for Windows Installer installations using ActiveX. |
| Agent Activation Runtime | Manual | Supports background tasks for apps that require extended activation and background work. |
| AllJoyn Router Service | Manual (Trigger Start) | Enables AllJoyn devices and apps to communicate with each other regardless of manufacturer or platform. (**Safe to disable ✅**) |
| App Readiness | Manual | Gets apps ready for use the first time a user signs in to a PC and when adding new apps. |
| Application Identity | Manual (Trigger Start) | Determines and verifies the identity of an application for AppLocker. |
| Application Information | Manual (Trigger Start) | Facilitates starting apps with additional privileges. |
| Application Layer Gateway Service | Manual | Provides support for plug-ins used by Internet Connection Sharing and Windows Firewall. |
| Application Management | Manual | Provides software installation services such as Assign, Publish, and Remove. |
| AppX Deployment Service (AppXSVC) | Manual (Trigger Start) | Deploys Store applications. If disabled, Store apps won't deploy. |
| AssignedAccessManager Service | Manual (Trigger Start) | Manages assigned access (kiosk mode) for a user account. |
| Auto Time Zone Updater | Disabled | Automatically sets the time zone of the device based on location. (**Safe to disable ✅**) |
| AVCTP service | Manual (Trigger Start) | Used by Bluetooth Audio/Video Control Transport Protocol devices. |
| Background Intelligent Transfer Service | Manual | Transfers files in the background using idle network bandwidth. Used by Windows Update. |
| Background Tasks Infrastructure Service | Automatic | Manages background task infrastructure for Windows. |
| Base Filtering Engine | Automatic | Mandatory service that manages firewall and IPsec policies. |
| BitLocker Drive Encryption Service | Manual (Trigger Start) | Manages BitLocker encryption for drives. |
| Block Level Backup Engine Service | Manual | Used by Windows Backup and System Restore. |
| Bluetooth Audio Gateway Service | Manual (Trigger Start) | Routes audio to/from a Bluetooth headset. |
| Bluetooth Support Service | Manual (Trigger Start) | Supports discovery and association of remote Bluetooth devices. |
| Bluetooth User Support Service | Manual (Trigger Start) | Provides user-mode interface support for Bluetooth functions. |
| BranchCache | Manual | Caches content from file and web servers on a local subnet. (**Safe to disable ✅**) |
| Capability Access Manager Service | Manual | Handles user consent and runtime access to device capabilities. |
| CaptureService | Manual | Supports screen and camera capture functionality for apps. |
| Cellular Time | Manual (Trigger Start) | Updates system time via cellular network. |
| Certificate Propagation | Manual (Trigger Start) | Propagates certificates from smart cards. |
| Client License Service (ClipSVC) | Manual (Trigger Start) | Provides support for Microsoft Store infrastructure. |
| Clipboard User Service | Manual | Provides clipboard experience across devices. |
| CNG Key Isolation | Manual (Trigger Start) | Isolates cryptographic operations using stored keys. |
| COM+ Event System | Automatic | Supports System Event Notification Service (SENS). |
| COM+ System Application | Manual | Manages COM+ configuration and tracking. |
| Connected Devices Platform Service | Automatic (Delayed Start, Trigger Start) | Enables discovery and interaction with connected devices. (**Safe to disable ✅**) |
| Connected Devices Platform User Service | Automatic | Supports user-specific device connections. (**Safe to disable ✅**) |
| Connected User Experiences and Telemetry | Automatic | Manages diagnostics and feedback. (**Safe to disable ✅**, breaks xbox achievement giving if disabled) |
| ConsentUX | Manual | Handles consent prompts for apps and Windows features. |
| Contact Data | Manual | Provides contact data services for apps. (**Safe to disable ✅**) |
| CoreMessaging | Automatic | Handles interprocess communication (IPC) across Windows. |
| Credential Manager | Manual | Stores credentials like usernames and passwords securely for applications. |
| CredentialEnrollmentManagerUserSvc | Manual | Manages credential enrollment for Windows Hello and other sign-in options. |
| Cryptographic Services | Automatic | Provides key management and certificate services for security. |
| Data Sharing Service | Manual (Trigger Start) | Manages sharing of data between apps. |
| Data Usage | Automatic | Tracks data usage statistics for network connections. |
| DCOM Server Process Launcher | Automatic | Launches COM and DCOM servers on demand. |
| debugregsvc | Automatic | Supports debugging and registration of components. |
| Declared Configuration(DC) service | Manual (Trigger Start) | Handles declared configuration of Windows features. |
| Delivery Optimization | Manual (Trigger Start) | Manages peer-to-peer downloads for Windows updates and apps. |
| Developer Tools Service | Manual | Supports developer tools and environment. |
| Device Association Service | Manual (Trigger Start) | Manages pairing of devices. |
| Device Install Service | Manual (Trigger Start) | Handles device driver installations. |
| Device Management Enrollment Service | Manual | Supports device management enrollment for enterprise. |
| Device Management Wireless Application Protocol (WAP) Push message Routing Service | Manual (Trigger Start) | Routes WAP push messages for mobile devices. (**Safe to disable ✅**) |
| Device Setup Manager | Manual (Trigger Start) | Manages device setup and configuration. |
| DeviceAssociationBroker | Manual | Handles device associations in the background. |
| DevicePicker | Manual | Manages device selection UI. (**Safe to disable ✅**) |
| DevicesFlow | Manual | Supports device interaction workflows. |
| DevQuery Background Discovery Broker | Manual (Trigger Start) | Helps discover devices and services on the network. |
| DHCP Client | Automatic | Obtains IP addresses and network configuration automatically. |
| Diagnostic Execution Service | Manual (Trigger Start) | Runs diagnostic tests for system health. |
| Diagnostic Policy Service | Automatic | Detects and troubleshoots problems. (**Safe to disable ✅**) |
| Diagnostic Service Host | Manual | Hosts diagnostic services. |
| Diagnostic System Host | Manual | Manages diagnostic system operations. |
| DialogBlockingService | Disabled | Prevents blocking dialogs during critical operations. |
| Display Enhancement Service | Manual (Trigger Start) | Improves display quality and performance. |
| Display Policy Service | Automatic (Delayed Start) | Manages display-related policies. (**Safe to disable ✅**) |
| Distributed Link Tracking Client | Automatic | Maintains links to files on NTFS volumes across a network. (**Safe to disable ✅**) |
| Distributed Transaction Coordinator | Manual | Coordinates transactions across multiple resources. |
| DNS Client | Automatic (Trigger Start) | Caches DNS names and resolves them. |
| Downloaded Maps Manager | Automatic (Delayed Start) | Manages offline map data. (**Safe to disable ✅**) |
| Embedded Mode | Manual (Trigger Start) | Supports embedded device scenarios. (**Safe to disable ✅**) |
| Encrypting File System (EFS) | Manual (Trigger Start) | Provides encryption for files on NTFS drives. |
| Enterprise App Management Service | Manual | Manages enterprise app deployment and policies. |
| Extensible Authentication Protocol | Manual | Supports various authentication methods. |
| Fax | Manual | Provides fax service support. (**Safe to disable ✅**) |
| File History Service | Manual (Trigger Start) | Manages file backups. (**Safe to disable ✅**) |
| Function Discovery Provider Host | Manual | Helps discover network devices. (**Safe to disable ✅**) |
| Function Discovery Resource Publication | Manual (Trigger Start) | Publishes device info to the network. (**Safe to disable ✅**) |
| GameDVR and Broadcast User Service | Manual | Provides user mode support for Game DVR and broadcasting. (**Safe to disable ✅**) |
| GameInput Service | Manual (Trigger Start) | Supports input devices for gaming. |
| Geolocation Service | Manual (Trigger Start) | Provides location data for apps and services. (**Safe to disable ✅**) |
| GraphicsPerfSvc | Manual (Trigger Start) | Collects graphics performance data. |
| Group Policy Client | Automatic (Trigger Start) | Applies group policies for users and computers. |
| Human Interface Device Service | Manual (Trigger Start) | Manages human interface devices like keyboards and mice. (**Safe to disable ✅**, improves input lag) |
| HV Host Service | Manual (Trigger Start) | Supports Hyper-V virtualization services. |
| Hyper-V Data Exchange Service | Manual (Trigger Start) | Exchanges data between host and virtual machines. |
| Hyper-V Guest Service Interface | Manual (Trigger Start) | Provides interface for guest services in VMs. |
| Hyper-V Guest Shutdown Service | Manual (Trigger Start) | Allows the host to shut down virtual machines. |
| Hyper-V Heartbeat Service | Manual (Trigger Start) | Monitors the health of virtual machines. |
| Hyper-V PowerShell Direct Service | Manual (Trigger Start) | Supports PowerShell direct commands for VMs. |
| Hyper-V Remote Desktop Virtualization Service | Manual (Trigger Start) | Enables remote desktop for virtual machines. |
| Hyper-V Time Synchronization Service | Manual (Trigger Start) | Synchronizes time between host and VMs. |
| Hyper-V Volume Shadow Copy Requestor | Manual (Trigger Start) | Supports backups of virtual machine disks. |
| IKE and AuthIP IPsec Keying Modules | Manual (Trigger Start) | Manages IPsec keying for secure communications. |
| Intel(R) Content Protection HECI Service | Manual | Provides content protection for Intel graphics. |
| Intel(R) HD Graphics Control Panel Service | Automatic | Manages Intel HD Graphics control panel functionality. |
| Internet Connection Sharing (ICS) | Manual (Trigger Start) | Shares internet connection with other devices on network. |
| IP Helper | Automatic | Provides tunnel connectivity using IPv6 transition technologies. (**Safe to disable ✅**) |
| IP Translation Configuration Service | Manual (Trigger Start) | Configures IP address translation. |
| IPsec Policy Agent | Manual (Trigger Start) | Manages IPsec policies and security associations. |
| KtmRm for Distributed Transaction Coordinator | Manual (Trigger Start) | Coordinates transactions for distributed resource managers. |
| Language Experience Service | Manual | Manages language experience for users. |
| Link-Layer Topology Discovery Mapper | Manual | Maps network topology for network discovery. |
| Local Profile Assistant Service | Manual (Trigger Start) | Assists with managing local user profiles. |
| Local Session Manager | Automatic | Manages user sessions and logon processes. |
| McpManagementService | Manual | Manages mobile broadband connections. |
| MessagingService | Manual (Trigger Start) | Supports messaging services for apps. (**Safe to disable ✅**) |
| Microsoft (R) Diagnostics Hub Standard Collector Service | Manual | Collects diagnostic information for troubleshooting. (**Safe to disable ✅**) |
| Microsoft Account Sign-in Assistant | Manual (Trigger Start) | Supports Microsoft account sign-in processes. |
| Microsoft App-V Client | Disabled | Supports virtualized application delivery. (**Safe to disable ✅**) |
| Microsoft Cloud Identity Service | Manual | Manages cloud identity authentication. |
| Microsoft Defender Antivirus Network Inspection Service | Manual | Provides network inspection for Microsoft Defender Antivirus. |
| Microsoft Defender Antivirus Service | Automatic | Core antivirus service for Windows Defender. |
| Microsoft Edge Elevation Service (MicrosoftEdgeElevationService) | Manual | Manages elevation requests for Microsoft Edge. (**Safe to disable ✅**) |
| Microsoft Edge Update Service (edgeupdate) | Automatic (Delayed Start, Trigger Start) | Updates Microsoft Edge automatically. (**Safe to disable ✅**) |
| Microsoft Edge Update Service (edgeupdatem) | Manual (Trigger Start) | Manages Microsoft Edge updates in the background. (**Safe to disable ✅**) |
| Microsoft iSCSI Initiator Service | Manual | Enables iSCSI storage connections. |
| Microsoft Keyboard Filter | Disabled | Filters keyboard input for certain devices. |
| Microsoft Passport | Manual (Trigger Start) | Supports Windows Hello authentication. |
| Microsoft Passport Container | Manual (Trigger Start) | Manages Passport authentication containers. |
| Microsoft Software Shadow Copy Provider | Manual | Supports shadow copies for backups. |
| Microsoft Storage Spaces SMP | Manual | Manages Storage Spaces functionality. |
| Microsoft Store Install Service | Manual | Installs and updates Microsoft Store apps. |
| Microsoft Windows SMS Router Service | Manual (Trigger Start) | Routes SMS messages for Windows devices.  (**Safe to disable ✅**) |
| Natural Authentication | Manual (Trigger Start) | Supports biometric authentication. |
| Net.Tcp Port Sharing Service | Disabled | Shares TCP ports for WCF services. (**Safe to disable ✅**) |
| Netlogon | Manual | Supports domain logon and authentication. (**Safe to disable ✅**) |
| Network Connected Devices Auto-Setup | Manual (Trigger Start) | Auto-configures connected network devices. |
| Network Connection Broker | Manual (Trigger Start) | Manages network connection profiles and policies. |
| Network Connections | Manual | Manages network connections. |
| Network Connectivity Assistant | Manual (Trigger Start) | Helps detect and repair network connectivity problems. |
| Network List Service | Manual | Identifies and lists networks the computer connects to. |
| Network Location Awareness | Automatic | Collects and stores network location information. |
| Network Setup Service | Manual (Trigger Start) | Helps with network setup and device discovery. |
| Network Store Interface Service | Automatic | Manages network-related configurations and events. |
| Offline Files | Disabled | Provides offline file support for network files. (**Safe to disable ✅**) |
| OpenSSH Authentication Agent | Disabled | Provides SSH authentication agent functionality. (**Safe to disable ✅**) |
| OpenSSH SSH Server | Manual | Provides SSH server capabilities. (**Safe to disable ✅**) |
| Optimize drives | Manual | Manages disk optimization and defragmentation. |
| Parental Controls | Manual | Manages parental control settings. (**Safe to disable ✅**) |
| Payments and NFC/SE Manager | Manual (Trigger Start) | Manages payments and NFC services. (**Safe to disable ✅**) |
| Peer Name Resolution Protocol | Manual | Resolves peer names on the network. |
| Peer Networking Grouping | Manual | Manages peer-to-peer networking groups. |
| Peer Networking Identity Manager | Manual | Manages peer networking identities. |
| Performance Counter DLL Host | Manual | Hosts performance counters for monitoring. |
| Performance Logs & Alerts | Manual | Collects performance logs and triggers alerts. |
| Phone Service | Manual (Trigger Start) | Manages telephony services. (**Safe to disable ✅**) |
| Plug and Play | Manual | Manages hardware detection and configuration. |
| PNRP Machine Name Publication Service | Manual | Publishes machine names using PNRP. |
| Portable Device Enumerator Service | Manual (Trigger Start) | Enumerates portable devices connected to the PC. |
| Power | Automatic | Manages power policy and power events. |
| Print Spooler | Automatic | Manages printing and spooling print jobs. (**Safe to disable ✅**) |
| Printer Extensions and Notifications | Manual | Supports printer extensions and notifications. (**Safe to disable ✅**) |
| PrintWorkflow | Manual (Trigger Start) | Manages workflows for printing processes. (**Safe to disable ✅**) |
| Problem Reports Control Panel Support | Manual | Supports the problem reporting interface. (**Safe to disable ✅**) |
| Program Compatibility Assistant Service | Manual | Assists in application compatibility issues. (**Safe to disable ✅**) |
| Quality Windows Audio Video Experience | Manual | Enhances audio and video quality. (**Safe to disable ✅**) |
| Radio Management Service | Manual | Manages wireless radio devices. (**Safe to disable ✅**) |
| Recommended Troubleshooting Service | Manual | Provides recommended fixes for problems. (**Safe to disable ✅**) |
| Remote Access Auto Connection Manager | Manual | Manages automatic remote access connections. |
| Remote Access Connection Manager | Manual | Manages VPN and dial-up connections. |
| Remote Desktop Configuration | Manual | Configures Remote Desktop settings. (**Safe to disable ✅**) |
| Remote Desktop Services | Manual | Provides remote desktop session host. (**Safe to disable ✅**) |
| Remote Desktop Services UserMode Port Redirector | Manual | Redirects remote desktop ports. (**Safe to disable ✅**) |
| Remote Procedure Call (RPC) | Automatic | Core service for RPC communication. |
| Remote Procedure Call (RPC) Locator | Manual | Manages RPC name resolution. |
| Remote Registry | Disabled | Allows remote registry management. |
| Retail Demo Service | Manual | Supports retail demo mode. (**Safe to disable ✅**) |
| Routing and Remote Access | Disabled | Provides routing and remote access services. |
| RPC Endpoint Mapper | Automatic | Maps RPC endpoints to network ports. |
| Secondary Logon | Manual | Enables running processes under alternate credentials. (**Safe to disable ✅**, unless using pin password from microsoft) |
| Secure Socket Tunneling Protocol Service | Manual | Supports SSTP VPN connections. |
| Security Accounts Manager | Automatic | Manages user account information. |
| Security Center | Automatic (Delayed Start) | Monitors and reports security health. |
| Sensor Data Service | Manual (Trigger Start) | Manages sensor data for devices. |
| Sensor Monitoring Service | Manual (Trigger Start) | Monitors sensor status and events. |
| Sensor Service | Manual (Trigger Start) | Provides sensor functionality for apps. |
| Server | Automatic (Trigger Start) | Provides file, print, and named pipe sharing. (**Safe to disable ✅**) |
| Shared PC Account Manager | Disabled | Manages accounts for shared PC scenarios. |
| Shell Hardware Detection | Automatic | Detects hardware events like media insertion. (**Safe to disable ✅**) |
| Smart Card | Manual (Trigger Start) | Manages smart card services. (**Safe to disable ✅**) |
| Smart Card Device Enumeration Service | Manual (Trigger Start) | Enumerates smart card devices. (**Safe to disable ✅**) |
| Smart Card Removal Policy | Manual | Enforces smart card removal policies. (**Safe to disable ✅**) |
| SNMP Service | Automatic | Supports SNMP network management. |
| SNMP Trap | Manual | Receives and processes SNMP traps. |
| Software Protection | Automatic (Delayed Start, Trigger Start) | Protects Windows and software licensing. |
| Spatial Data Service | Manual | Manages spatial data for apps. |
| Spot Verifier | Manual (Trigger Start) | Verifies Windows Store apps. |
| SSDP Discovery | Manual | Discovers UPnP devices on the network. (**Safe to disable ✅**) |
| SshdBroker | Manual | Manages SSH broker services. |
| State Repository Service | Manual | Manages app state repository. |
| Still Image Acquisition Events | Manual | Manages camera and scanner events. (**Safe to disable ✅**) |
| Storage Service | Automatic (Delayed Start, Trigger Start) | Manages storage-related services. |
| Storage Tiers Management | Manual | Manages storage tiers and policies. |
| Sync Host | Automatic (Delayed Start) | Manages syncing of files and settings. (**Safe to disable ✅**) |
| SysMain | Automatic | Caches most of the apps into disk in \windows\prefetch for better launching. (**Safe to disable ✅**, less ram usage, better performance overall) |
| System Event Notification Service | Automatic | Notifies system events and logon/logoff. (**Safe to disable ✅**) |
| System Events Broker | Automatic (Trigger Start) | Manages system event subscriptions. |
| System Guard Runtime Monitor Broker | Automatic (Delayed Start, Trigger Start) | Monitors system security runtime state. |
| Task Scheduler | Automatic | Schedules automated tasks. |
| TCP/IP NetBIOS Helper | Manual (Trigger Start) | Provides NetBIOS over TCP/IP support. (**Safe to disable ✅**) |
| Telephony | Manual | Manages telephony services and devices. (**Safe to disable ✅**) |
| Themes | Automatic | Manages themes and visual styles. (**Safe to disable ✅**) |
| Time Broker | Manual (Trigger Start) | Manages background task execution. |
| Touch Keyboard and Handwriting Panel Service | Manual (Trigger Start) | Supports touch keyboard and handwriting input. |
| Udk User Service | Manual | Manages user services for UDK. |
| Update Orchestrator Service | Automatic (Delayed Start) | Manages Windows updates. (**Safe to disable ✅**, re-enables itself most of the time) |
| UPnP Device Host | Manual | Hosts UPnP devices on the network. |
| User Data Access | Manual | Manages user data access for apps. (**Safe to disable ✅**) |
| User Data Storage | Manual | Stores user data for applications. (**Safe to disable ✅**) |
| User Experience Virtualization Service | Disabled | Manages user settings virtualization. (**Safe to disable ✅**) |
| User Manager | Automatic (Trigger Start) | Manages user sessions. |
| User Profile Service | Automatic | Loads and unloads user profiles. |
| Virtual Disk | Manual | Manages virtual disk operations. |
| Volume Shadow Copy | Manual | Provides backup and restore using shadow copies. |
| Volumetric Audio Compositor Service | Manual | Manages 3D audio effects. |
| WalletService | Manual | Manages digital wallet and payments. (**Safe to disable ✅**) |
| WarpJITSvc | Manual (Trigger Start) | Improves performance of JavaScript in Windows. |
| Web Account Manager | Manual | Manages web account authentication. |
| Web Management | Disabled | Manages web server configuration. |
| WebClient | Manual (Trigger Start) | Enables WebDAV client support. |
| Wi-Fi Direct Services Connection Manager Service | Manual (Trigger Start) | Manages Wi-Fi Direct device connections. |
| Windows Audio | Automatic | Manages audio devices and streams. |
| Windows Audio Endpoint Builder | Automatic | Builds audio endpoints for devices. |
| Windows Backup | Manual | Provides backup functionality. (**Safe to disable ✅**) |
| Windows Biometric Service | Manual (Trigger Start) | Manages biometric devices and authentication. (**Safe to disable ✅**, unless using fingerprint passwords) |
| Windows Camera Frame Server | Manual (Trigger Start) | Manages camera frames for apps. (**Safe to disable ✅**) |
| Windows Connect Now - Config Registrar | Manual | Supports Wi-Fi device configuration. |
| Windows Connection Manager | Automatic (Trigger Start) | Manages network connections. |
| Windows Defender Advanced Threat Protection Service | Manual | Provides advanced threat protection. |
| Windows Defender Firewall | Automatic | Provides firewall protection. |
| Windows Encryption Provider Host Service | Manual (Trigger Start) | Supports encryption providers. |
| Windows Error Reporting Service | Manual (Trigger Start) | Reports errors to Microsoft. (**Safe to disable ✅**) |
| Windows Event Collector | Manual | Collects event logs from remote computers. |
| Windows Event Log | Automatic | Logs Windows system events. |
| Windows Font Cache Service | Automatic | Caches font data for faster access. (**Safe to disable ✅**) |
| Windows Image Acquisition (WIA) | Manual (Trigger Start) | Manages imaging devices like scanners. (**Safe to disable ✅**) |
| Windows Insider Service | Manual (Trigger Start) | Manages Windows Insider program. (**Safe to disable ✅**) |
| Windows Installer | Manual | Installs Windows software packages. |
| Windows License Manager Service | Manual (Trigger Start) | Manages Windows licenses. |
| Windows Management Instrumentation | Automatic | Provides management and instrumentation framework. |
| Windows Management Service | Manual | Supports remote management. |
| Windows Media Player Network Sharing Service | Manual | Shares media libraries over network. |
| Windows Mixed Reality OpenXR Service | Manual | Supports Mixed Reality and OpenXR. (**Safe to disable ✅**) |
| Windows Mobile Hotspot Service | Manual (Trigger Start) | Manages mobile hotspot functionality. (**Safe to disable ✅**) |
| Windows Modules Installer | Manual | Installs Windows updates and modules. |
| Windows Perception Service | Manual (Trigger Start) | Supports Windows Perception platform. |
| Windows Perception Simulation Service | Manual | Simulates perception sensors for testing. |
| Windows Presentation Foundation Font Cache 3.0.0.0 | Manual | Caches fonts for WPF applications. |
| Windows Push Notifications System Service | Automatic | Manages push notifications for apps. (**Safe to disable ✅**) |
| Windows Push Notifications User Service | Automatic | Handles user-specific push notifications. (**Safe to disable ✅**, disables notification pop ups) |
| Windows PushToInstall Service | Manual (Trigger Start) | Manages app installs from push notifications. |
| Windows Remote Management (WS-Management) | Manual | Enables remote management via WS-Management. |
| Windows Search | Automatic (Delayed Start) | Provides content indexing and search. (**Safe to disable ✅**) |
| Windows Security Service | Manual | Manages Windows security features. |
| Windows Time | Manual (Trigger Start) | Synchronizes system time with time servers. |
| Windows Update | Manual (Trigger Start) | Manages Windows update process. (**Safe to disable ✅**, stops windows update, microsoft app updates, other microsoft downloadable things) |
| Windows Update Medic Service | Manual | Repairs Windows Update components. |
| WinHTTP Web Proxy Auto-Discovery Service | Manual | Detects proxy configuration automatically. |
| Wired AutoConfig | Manual | Manages wired Ethernet authentication. |
| WLAN AutoConfig | Manual | Manages wireless network connections. |
| WMI Performance Adapter | Manual | Provides performance library information. (**Safe to disable ✅**) |
| Work Folders | Manual | Syncs user files to corporate servers. (**Safe to disable ✅**) |
| Workstation | Automatic | Provides network connections and communications. (**Safe to disable ✅**) |
| WWAN AutoConfig | Manual | Manages mobile broadband connections. |
| Xbox Accessory Management Service | Manual (Trigger Start) | Manages Xbox accessories. |
| Xbox Live Auth Manager | Manual | Manages Xbox Live authentication. |
| Xbox Live Game Save | Manual (Trigger Start) | Saves game data to Xbox Live cloud. |
| Xbox Live Networking Service | Manual | Manages Xbox Live network connectivity. |
| 1394ohci.sys | Manual (3) | 1394ohci.sys is a system bus driver introduced on the Windows 7 operating system that supports greater speeds and numerous hardware media. This is a critical Windows component and should not be disabled or removed. (**Safe to disable ✅**, i literally tested it) |
| AppvVemgr.sys | Manual (3) | AppvVemgr.sys is a Windows system driver associated with Microsoft’s Application Virtualization (App-V) platform. (**Safe to disable ✅**, i literally tested it) |
| CSC.sys | Kernel (1) | CSC.sys is a Windows system driver that powers the Client Side Caching (CSC) feature, also known as Offline Files. (**Safe to disable ✅**, i literally tested it) |
