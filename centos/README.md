Manual way (qucik and dirty)

```
# Not relabeling bulletproof
wget -O /sbin/custom-set-vm-hostname https://github.com/rjsocha/custom-set-vm-hostname/raw/master/centos/custom-set-vm-hostname
chcon  system_u:object_r:bin_t:s0 /sbin/custom-set-vm-hostname
systemctl edit NetworkManager.service
[Unit]
After=vmtoolsd.service

systemctl edit vmtoolsd.service
[Unit]
Before=NetworkManager.service


systemctl edit --force custom-set-vm-hostname.service --full
[Unit]
After=vmtoolsd.service
Before=NetworkManager.service

[Service]
ExecStart=/sbin/custom-set-vm-hostname
Type=oneshot

[Install]
WantedBy=multi-user.target

systemctl enable custom-set-vm-hostname.service
```
