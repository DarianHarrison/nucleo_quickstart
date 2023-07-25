# Connect to gdb remote server
target remote :3333
# target extended-remote :3333

# Load will flash the code
load

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

# #
monitor arm semihosting enable

# Set a breakpoint at main, aka entry
break main

# Set a breakpoint at DefaultHandler
break DefaultHandler

# Set a breakpoint at HardFault
break HardFault

# #
break rust_begin_unwind

# *try* to stop at the user entry point (it might be gone due to inlining)
# break main

# Continue running until we hit the main breakpoint
continue

# Step from the trampoline code in entry into main
step

# start the process but immediately halt the processor
# stepi


# Continue running until we hit the main breakpoint
# continue


# quit