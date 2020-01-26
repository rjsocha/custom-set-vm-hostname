@echo off
if [%1] == [] goto NOARGS
setlocal
set TEMPLATE_VM=ubuntu-18.04-template
set DST=o:\vm

set VMBOX=C:\Program Files\Oracle\VirtualBox
set PATH=%VMBOX%;%PATH%
set VM=%1

IF exist %DST%\%VM%\nul goto VMEXISTS

"%VMBOX%\VBoxManage.exe" clonevm %TEMPLATE_VM% --basefolder %DST% --name %VM% --options link --snapshot ubuntu --register
"%VMBOX%\VBoxManage.exe" guestproperty set %VM% custom.name %VM%
"%VMBOX%\VBoxManage.exe" startvm %VM% 

goto THEEND

:NOARGS
echo Missing vm name!
goto THEEND

:VMEXISTS
echo VM %VM% already exists!

:THEEND
