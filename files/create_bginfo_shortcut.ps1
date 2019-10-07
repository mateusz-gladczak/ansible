$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\run_bginfo.lnk")
$Shortcut.TargetPath = "C:\Windows\bginfo.exe"
$Shortcut.Arguments = " c:\windows\ansible.bgi /timer:0 /silent /NOLICPROMPT"
$Shortcut.Save()