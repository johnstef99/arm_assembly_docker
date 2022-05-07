### How to debug

You can run `make debug` in a tmux session which will start gdb in a new
window. From there you can use the command `step` to go through your program
step by step and watch the values of registers at any point.

By default gdb executes commands found in `.gdbinit` in your project

```bash
file bin/main.elf               # loads the program symbols
target remote 127.0.0.1:1234    # connects with qemu-arm
layout regs                     # changes layout to show registers
```
