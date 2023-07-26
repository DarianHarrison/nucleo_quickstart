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

 (optional) cargo-generate
```bash
sudo apt install -y libssl-dev pkg-config # prereqs for cargo-generate
cargo install cargo-generate
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
Bus 001 Device 023: ID 0483:374b STMicroelectronics ST-LINK/V2.1


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
```bash
ls -l /dev/bus/usb/001/026 # should be crw-rw-rw-
```
crw-rw-rw-+ 1 root plugdev 189, 25 Mar  8 06:36 /dev/bus/usb/001/026



 3. connect and verify (uses files from the above scripts path)
```bash
openocd -s /usr/share/openocd/scripts/ -f interface/stlink.cfg -f target/stm32l4x.cfg
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





