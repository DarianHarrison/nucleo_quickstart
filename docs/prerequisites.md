## 0. Setup

 Have Rust installed and updated
```bash
rustup default stable
rustup update ; rustc --version --verbose
```

 Add a compilation target to add cross compilation support for the ARM Cortex-M architecture. The below is used for the nucleo
```bash
rustup target add thumbv7em-none-eabihf
```

 cargo-binutils
```bash
cargo install cargo-binutils
rustup component add llvm-tools-preview
```

 debug tools 
```bash
sudo apt-get install -y gdb-multiarch openocd
```

 validate that openocd interfaces & targets are available, (these should have been installed installed with above command), we will  use these to configure our board in a future step
```bash
ls /usr/share/openocd/scripts/
```

 usb: find idVendor & idProduct (assuming you're connected via usb)
```
lsusb | grep -i st
```
Bus 001 Device 033: ID 0483:374b STMicroelectronics ST-LINK/V2.1

 check permissions
```bash
ls -l /dev/bus/usb/001/033
```
crw-rw-r--+ 1 root root 189, 32 Jul 26 06:09 /dev/bus/usb/001/033


 on linux: This rule lets you use OpenOCD with the Nucelo board without root privilege.
```bash
sudo sh -c 'cat << 'EOF' > /etc/udev/rules.d/70-st-link.rules
# nucleo l6432KC
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", TAG+="uaccess"
EOF'
```

```bash
sudo udevadm control --reload-rules
```
```
plug board back out and back in
```

 find idVendor & idProduct (assuming you're connected via usb)
```sh
lsusb | grep -i st
```
Bus 001 Device 034: ID 0483:374b STMicroelectronics ST-LINK/V2.1


```sh
ls -l /dev/bus/usb/001/034
```
crw-rw----+ 1 root plugdev 189, 33 Jul 26 06:16 /dev/bus/usb/001/034

 manually validate that you can use semihosting to connect to the board
```bash
openocd -s /usr/share/openocd/scripts/ -f interface/stlink.cfg -f target/stm32l4x.cfg
```

 setup is validated, you can now exit
```
CTRL + C
```