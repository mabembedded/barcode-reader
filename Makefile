PWD=$(shell pwd)
SRC_DIR := $(PWD)/src
OBJ_DIR := $(PWD)/obj
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

CFLAGS := -I$(PWD)/inc -I$(PWD)/inc/qrcode -I$(PWD)/inc/decoder -I$(PWD)/inc/processor

barcode-reader: $(OBJ_FILES)
	gcc $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^
