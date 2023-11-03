# **FemboyOS 21H2**
FemboyOS is an open-srouce custom Windows OS alternative based on Windows 10 IoT Enterprise 2021 and has a lot of debloats and optimizations for your system, "automatcally" and with automatic updates on the installation.
#
* [**Stock ISO for Windows 10 IoT Enterprise 21H2**](https://bafybeicfku5j343hn3h6qj3l4fjqj5xu5542xhhhcnt6ivhduxp4ldu7re.ipfs.dweb.link/?filename=en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso)
  
* [**Install Microsoft Store and XBOX Identify**](https://github.com/kkkgo/LTSC-Add-MicrosoftStore)
#
### **Fix VALORANT Anticheat Block ([Control Flow Guard Disabled](https://support-valorant.riotgames.com/hc/en-us/articles/4406555340179-How-to-Enable-Exploit-Protection-and-Prevent-Error-Code-VAN9002))**
* Paste it on `Powershell` **(Reboot your system after that)**
```ps1
Set-ProcessMitigation -System -Enable CFG
```
#
### **Uninstall Microsoft Edge**
* Paste it on `Powershell` **(Run again if you want to install it again)**
```ps1
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/AveYo/fox/main/Edge_Removal.bat'))
```
#
## Some extra tweaks that may help a bit in your performace
* [Best Win32PrioritySeparation value](https://github.com/amitxv/PC-Tuning/blob/main/docs/research.md#the-truth-behind-ambiguous-values)
* [XHCI Interrupt Moderation (IMOD)](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#xhci-interrupt-moderation-imod)
* [Raise the Clock Interrupt Frequency (Timer Resolution)](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#raise-the-clock-interrupt-frequency-timer-resolution)
* [Message Signaled Interrupts](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#message-signaled-interrupts)
* [GPU and DirectX Graphics Kernel (AutoGpuAffinity)](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#gpu-and-directx-graphics-kernel)
* [Configure Audio Devices (LowAudioLatency)](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#configure-audio-devices)
#
* **[Hone](https://hone.gg/) has much of the tweaks listed above and is easier to setup. Give it a try. 😉**
#

### Credits for some tweaks
* Melody
* Felipetweaks
* AMITVX
