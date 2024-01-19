# **FemboyOS IoT LTSC**
FemboyOS is an open-source custom Windows OS alternative based on Windows 10 IoT LTSC 2021 and has a lot of debloats and optimizations for your system, with automatic updates from the repository in the installation.
#
[![Download zip](https://custom-icon-badges.herokuapp.com/badge/-Download-gray?style=for-the-badge&logo=download&logoColor=white "Download zip")]()
* [**Stock ISO for Windows 10 IoT Enterprise 21H2**](https://dl.bobpony.com/windows/10/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso) (Required for the raw installation video)
#

## Installing GPU Drivers
<details closed>
<br>
<summary><h3>NVIDIA Drivers</h3></summary>
1. <a href="https://www.techpowerup.com/download/techpowerup-nvcleanstall/">Install NVCleanstall</a>
<br><br>
2. Choose the latest version and copy the settings below
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/1NVChad.png" style="width:400px;height:480px;"></img>
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/2NVChad.png" style="width:400px;height:480px;"></img>

3. Apply NVIDIA tweaks for better perforamce (Open `cmd.exe` and paste it)
  
```bat
code
```
</details>

<details closed>
<br>
<summary><h3>AMD Drivers</h3></summary>
1. <a href="https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/latest">Install Radeon Software Slimmer</a>
<br><br>
2. Download the latest driver for your GPU in AMD website
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/4AMDip.png" style="width:802px;height:136px;"></img>
<br><br>
3. Copy the settings below for Radeon Software Slimmer
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/1AMDip.png" style="width:960px;height:514px;"></img>
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/2AMDip.png" style="width:960px;height:514px;"></img>
<br><br>
<img src="https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/images/3AMDip.png" style="width:960px;height:514px;"></img>
<br><br>
4. Apply AMD tweaks for better perforamce (Open `cmd.exe` and paste it)
    
```bat
curl -g -k -L -# -o "C:\Windows\Temp\AMD.bat" "https://raw.githubusercontent.com/heitorrosa/FemboyOS/iotltsc/AMD.bat" >NUL 2>&1 & powershell Start-Process -FilePath "C:\Windows\Temp\AMD.bat
```
</details>

## Extra Tweaks
<details closed>
<br>
<summary><h3>Win32PrioritySeparation Guide</h3></summary>
</details>

<details closed>
<br>
<summary><h3>Affinity Guide</h3></summary>
  
* [GPU and DirectX Graphics Kernel (AutoGpuAffinity)](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#gpu-and-directx-graphics-kernel)
</details>

#
* [Calypto's Latency Guide](https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4)
* [Message Signaled Interrupts](https://github.com/amitxv/PC-Tuning/blob/main/docs/post-install.md#message-signaled-interrupts)
#
## **[Hone](https://github.com/auraside/Hone) has much of the tweaks listed above and is easier to setup. Give it a try. 😉**

### Credits for some tweaks
* Melody [(Provided the raw guide without most of the tweaks)](https://www.youtube.com/embed/F_4BPuqn0_o)
* Felipetweaks
* AMITXV
* imribiy
* ancel
