; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Grible"
#define MyAppVersion "0.9.3"
#define MyAppPublisher "Grible Team"
#define MyAppURL "http://localhost:8123"
#define MyAppSiteURL "http://www.grible.org/"
#define BaseDir "D:\Tools\Grible32"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D380C797-94B5-4521-9F4F-4DCEFBE6BE92}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Tools\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile={#BaseDir}\LISENCE.txt
OutputDir=D:\Tools\InnoOutput
OutputBaseFilename=grible-32bit
SetupIconFile={#BaseDir}\grible.ico
Compression=lzma
SolidCompression=yes

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Dirs]
Name: "{app}\jdk"

[Files]
Source: "{#BaseDir}\grible.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\grible.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\grible.war"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\grible.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\restart.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\jdk\*"; DestDir: "{app}\jdk"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppSiteURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Grible"; Filename: "{#MyAppURL}"; Tasks: desktopicon

[Run]
Filename: "{app}\grible.exe"; Parameters: "install"
Filename: "{app}\grible.exe"; Parameters: "start"

[UninstallRun]
Filename: "{app}\grible.exe"; Parameters: "stop"
Filename: "{app}\grible.exe"; Parameters: "unintall"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

