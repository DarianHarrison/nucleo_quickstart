# nucleo
 
6:00 - 



## Debug

0. make sure to follow setup prerequisites: [https://github.com/DarianHarrison/embedded_ml/docs/prerequisites.md](https://github.com/DarianHarrison/embedded_ml/blob/main/docs/prerequisites.md)

1. make sure you have debug on first terminal, notice that it is taking the config from ```openocd.cfg``` file.
```bash
openocd
```

2. on second terminal
```bash
clear && cargo run --release --example blinky
```




## References

crates:
https://crates.io/crates/stm32l4xx-hal

datasheet:
https://www.st.com/resource/en/datasheet/stm32l432kb.pdf

all gdb functions:
https://docs.rust-embedded.org/discovery/f3discovery/appendix/2-how-to-use-gdb/index.html
