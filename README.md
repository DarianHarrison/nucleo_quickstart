# nucleo
 
6:00 - 


sources:

crates:
https://crates.io/crates/stm32l4xx-hal

datasheet:
https://www.st.com/resource/en/datasheet/stm32l432kb.pdf



 Have Rust installed and updated
```bash
rustup default stable
rustup update ; rustc --version --verbose
```

Add a compilation target to add cross compilation support for the ARM Cortex-M architecture.
```bash
rustup target add thumbv7em-none-eabihf
```

 cargo-binutils
```bash
cargo install cargo-binutils
rustup component add llvm-tools-preview
```


### 1. Setup

 0. tools 
```bash
sudo apt-get install -y gdb-multiarch openocd
```

 1. verify supported interfaces & targets (installed with above command)
```bash
ls /usr/share/openocd/scripts/
```

 2.  udev rules

find idVendor & idProduct (assuming you're connected via usb)
```
lsusb | grep -i st
```
Bus 001 Device 033: ID 0483:374b STMicroelectronics ST-LINK/V2.1

```bash
ls -l /dev/bus/usb/001/033
```
crw-rw-r--+ 1 root root 189, 32 Jul 26 06:09 /dev/bus/usb/001/033



on linux: This rule lets you use OpenOCD with the Discovery board without root privilege.
```bash
sudo sh -c 'cat << 'EOF' > /etc/udev/rules.d/70-st-link.rules
# nucleo l6432KC
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", TAG+="uaccess"
EOF'
```

```bash
sudo udevadm control --reload-rules
```

 verify
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

 3. connect and verify
```bash
openocd -s /usr/share/openocd/scripts/ -f interface/stlink.cfg -f target/stm32l4x.cfg
```

4. setup is validated, you can now exit
```
CTRL + C
```

 2. Scripted

make sure you have debug on first terminal
```bash
opencod
```
on second terminal
```bash
# cargo clean # optional
cargo build ; cargo run
```


all gdb functions
```
https://docs.rust-embedded.org/discovery/f3discovery/appendix/2-how-to-use-gdb/index.html
```





