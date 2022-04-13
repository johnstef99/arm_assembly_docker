OBJ_DIR = ./obj
BIN_DIR = ./bin
ASM_DIR = ./src

ASM_FILES = $(wildcard $(ASM_DIR)/*.s)
OBJ_FILES = $(ASM_FILES:$(ASM_DIR)/%.s=$(OBJ_DIR)/%.o)
ELF_FILES = $(BIN_DIR)/hello.elf

build: $(ELF_FILES)

$(OBJ_DIR)/%.o: $(ASM_DIR)/%.s
	arm-linux-gnueabi-as $^ -o $@

$(ELF_FILES): $(OBJ_FILES)
	arm-linux-gnueabi-gcc $^ -o $@ -nostdlib

run:
	qemu-arm $(ELF_FILES)

watch:
	while true; do \
		make build; \
		inotifywait -qre close_write .; \
	done

.PHONY: clean all

clean:
	rm -f $(BIN_DIR)/* $(OBJ_DIR)/*
