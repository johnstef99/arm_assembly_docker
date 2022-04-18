OBJ_DIR = ./obj
BIN_DIR = ./bin
ASM_DIR = ./src

ASM_FILES = $(wildcard $(ASM_DIR)/*.s)
OBJ_FILES = $(ASM_FILES:$(ASM_DIR)/%.s=$(OBJ_DIR)/%.o)
ELF_FILES = $(BIN_DIR)/main.elf

build: $(ELF_FILES)

$(OBJ_DIR)/%.o: $(ASM_DIR)/%.s
	arm-linux-gnueabi-as $^ -g -o $@

$(ELF_FILES): $(OBJ_FILES)
	arm-linux-gnueabi-ld $^ -g -o $@ -nostdlib

run:
	qemu-arm $(ELF_FILES)

watch:
	while true; do \
		make build; \
		inotifywait -qre close_write .; \
	done

push:
	rsync -rutvzP . root@johnstef.com:/root/arm/playground

pull:
	rsync -rutvzP root@johnstef.com:/root/arm/playground/* .

debug:
	tmux neww gdb-multiarch
	qemu-arm -singlestep -g 1234 $(ELF_FILES)

.PHONY: clean all

clean:
	rm -f $(BIN_DIR)/* $(OBJ_DIR)/*
