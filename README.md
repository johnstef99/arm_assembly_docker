# ARM assembly dockerized

Using this docker you can compile and run arm 32bit assembly code using a x86 
machine. In the [examples](./examples/) directory you can find a *hello world* 
example that contains a Makefile to help you get started.

Basically this container uses `arm-linux-gnueabi` to compile & ling assembly
code and `qemu-arm` to run the arm executable.

I added some default configs for vim, zsh and tmux. But you can mount your
project dir to the container to edit it on your main system and only use the
container to compile and run the project.

## How to use

```sh
# build the container
docker build -t arm_asm .
# get into container and mount the example folder
docker run -it -v $(pwd)/examples:/root/examples arm_asm 

cd examples/hello
make        # compile the code
make run    # run it with qemu
```
