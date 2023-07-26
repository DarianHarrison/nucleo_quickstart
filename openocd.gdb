# Connect to gdb remote server
target extended-remote :3333

# Enable demangling asm names on disassembly
set print asm-demangle on

# Enable pretty printing
set print pretty on

# Disable style sources as the default colors can be hard to read
set style sources off

# set backtrace limit to not have infinite backtrace loops
set backtrace limit 32

# dont ask for confirmation prior to quit
set confirm off

# Initialize monitoring so iprintln! macro output
# is sent from the itm port to itm.txt
# 8000000 must match the core clock frequency
# (the microcontroller SWO pin must be connected to the programmer SWO pin)
monitor tpiu config internal itm.txt uart off 8000000

# Turn on the itm port ITM port 0
monitor itm port 0 on

#
monitor arm semihosting enable

# Load will flash the code
load

# Set a breakpoint at main, aka entry
break main

# detect unhandled exceptions, hard faults and panics
break DefaultHandler
break HardFault
break rust_begin_unwind

# Continue running until we hit the main breakpoint
continue

# Step from the trampoline code in entry into main
step

quit