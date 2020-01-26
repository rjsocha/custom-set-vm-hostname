@echo off
if [%1] == [] goto NOARGS
setlocal
set TEMPLATE_VMX=O:\vmware\ubuntu-18.04-template\ubuntu-18.04-template.vmx
set VMWS=c:\Program Files (x86)\VMware\VMware Workstation
set PATH=%VMWS%;%PATH%
set VM=%1
set DST=o:\vmware
IF exist %DST%\%VM%\nul goto VMEXISTS
"%VMWS%\vmrun" -T ws clone %TEMPLATE_VMX% %DST%\%VM%\%VM%.vmx full -snapshot ubuntu -cloneName="%VM%"
echo guestinfo.custom.name="%VM%" >>o:\vmware\%VM%\%VM%.vmx
"%VMWS%\vmrun" -T ws start o:\vmware\%VM%\%VM%.vmx
goto THEEND

:NOARGS
echo Missing vm name!
goto THEEND

:VMEXISTS
echo VM %VM% already exists!

:THEEND
