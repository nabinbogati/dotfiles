# Common Fixes & Configuration

## 1. Fix External USB WiFi Adapter Issues

If your USB WiFi adapter is unstable or not working properly:

### Steps:

1. Disable `wpa_supplicant`

   ```bash
   sudo systemctl disable wpa_supplicant
   sudo systemctl stop wpa_supplicant
   ```

2. Install `iwd`

   ```bash
   sudo apt install iwd
   ```

3. Configure NetworkManager to use `iwd`

   Create/edit:

   ```bash
   sudo nano /etc/NetworkManager/conf.d/wifi_backend.conf
   ```

   Add:

   ```ini
   [device]
   wifi.backend=iwd
   wifi.iwd.autoconnect=yes
   ```

4. Restart NetworkManager

   ```bash
   sudo systemctl restart NetworkManager
   ```

### Extra (POP!_OS only)

Prevent network interface renaming:

```bash
sudo kernelstub -a "net.ifnames=0"
```

---

## 2. Enable Monitor Brightness Control

If brightness controls don’t work:

```bash
sudo modprobe i2c_dev
```

To make it persistent:

```bash
echo "i2c_dev" | sudo tee /etc/modules-load.d/i2c_dev.conf
```

---

## 3. Fix Login Keyring Issues

If you get constant keyring password prompts:

1. Install Seahorse:

   ```bash
   sudo apt install seahorse
   ```

2. Open **Passwords and Keys**

3. Set **Default Keyring password** to empty (blank)

---

## 4. Enable VLC Dark Mode

### Temporary:

```bash
export QT_QPA_PLATFORMTHEME="qt5ct"
```

### Future (Qt6):

```bash
export QT_QPA_PLATFORMTHEME="qt6ct"
```

### Optional (Noctalia theme):

* Open `qt5ct`
* Set theme to **Noctalia**

---

## 5. Android Emulator Setup

### Install Required Tools

```bash
sdkmanager "emulator" \
"platform-tools" \
"system-images;android-34;google_apis;x86_64" \
"platforms;android-34" \
"build-tools;34.0.0"
```

---

### Create Emulator (AVD)

```bash
avdmanager create avd -n test \
-k "system-images;android-34;google_apis;x86_64" \
-d "pixel"
```

---

### Wayland Fix (Important)

```bash
export QT_QPA_PLATFORM='wayland;xcb'
```

---

### Run Emulator

#### For NVIDIA GPUs:

```bash
__NV_PRIME_RENDER_OFFLOAD=1 \
__GLX_VENDOR_LIBRARY_NAME=nvidia \
emulator @test -gpu host -no-snapshot -feature -Vulkan
```

#### For non-NVIDIA systems:

```bash
emulator @test -gpu host -no-snapshot -feature -Vulkan
```

---
