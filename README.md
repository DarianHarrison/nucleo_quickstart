# nucleo
 
4 3/4
15:00 - 


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

 cargo-generate
```bash
sudo apt install -y libssl-dev pkg-config # prereqs for cargo-generate
cargo install cargo-generate
```

 GDB Debugger
```bash
sudo apt-get install -y  gdb-multiarch openocd
```

on linux: This rule lets you use OpenOCD with the Discovery board without root privilege.
```bash
sudo sh -c 'cat << 'EOF' > /etc/udev/rules.d/70-st-link.rules
# nucleo l6432KC
ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", TAG+="uaccess"
EOF'
```
reload all udev rules
```bash
sudo udevadm control --reload-rules
```
If you had the board plugged to your laptop, unplug it and then plug it again.


validate
```bash
lsusb | grep -i stm
ls -l /dev/bus/usb/002/014
```

```bash
cargo clean ; cargo build --example hello
```


scripted

```bash
gdb-multiarch -x openocd.gdb target/thumbv7em-none-eabihf/debug/examples/hello

target extended-remote :3333
```


 scripted
```bash
openocd -f interface/stlink.cfg -f target/stm32f3x.cfg
```


all gdb functions
```
https://docs.rust-embedded.org/discovery/f3discovery/appendix/2-how-to-use-gdb/index.html
```