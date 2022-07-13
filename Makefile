PWD=$(shell pwd)

BASE_SRC_DIR := $(PWD)
BASE_SRC_FILES := $(wildcard $(BASE_SRC_DIR)/*.c)
BASE_OBJ_FILES := $(patsubst $(BASE_SRC_DIR)/%.c,$(BASE_SRC_DIR)/%.o,$(BASE_SRC_FILES))

DECODER_SRC_DIR := $(PWD)/decoder
DECODER_SRC_FILES := $(wildcard $(DECODER_SRC_DIR)/*.c)
DECODER_OBJ_FILES := $(patsubst $(DECODER_SRC_DIR)/%.c,$(DECODER_SRC_DIR)/%.o,$(DECODER_SRC_FILES))

PROCESSOR_SRC_DIR := $(PWD)/processor
PROCESSOR_SRC_FILES := $(wildcard $(PROCESSOR_SRC_DIR)/*.c)
PROCESSOR_OBJ_FILES := $(patsubst $(PROCESSOR_SRC_DIR)/%.c,$(PROCESSOR_SRC_DIR)/%.o,$(PROCESSOR_SRC_FILES))

QRCODE_SRC_DIR := $(PWD)/qrcode
QRCODE_SRC_FILES := $(wildcard $(QRCODE_SRC_DIR)/*.c)
QRCODE_OBJ_FILES := $(patsubst $(QRCODE_SRC_DIR)/%.c,$(QRCODE_SRC_DIR)/%.o,$(QRCODE_SRC_FILES))

VIDEO_SRC_DIR := $(PWD)/video
VIDEO_SRC_FILES := $(wildcard $(VIDEO_SRC_DIR)/*.c)
VIDEO_OBJ_FILES := $(patsubst $(VIDEO_SRC_DIR)/%.c,$(VIDEO_SRC_DIR)/%.o,$(VIDEO_SRC_FILES))

WINDOW_SRC_DIR := $(PWD)/window
WINDOW_SRC_FILES := $(wildcard $(WINDOW_SRC_DIR)/*.c)
WINDOW_OBJ_FILES := $(patsubst $(WINDOW_SRC_DIR)/%.c,$(WINDOW_SRC_DIR)/%.o,$(WINDOW_SRC_FILES))

CFLAGS := -I$(PWD)/ -I$(PWD)/qrcode -I$(PWD)/decoder -I$(PWD)/processor

LDFLAGS := -lpng

barcode-reader: $(BASE_OBJ_FILES) $(DECODER_OBJ_FILES) $(PROCESSOR_OBJ_FILES) $(QRCODE_OBJ_FILES) $(VIDEO_OBJ_FILES) $(WINDOW_OBJ_FILES)
	gcc $(LDFLAGS) -o $@ $^

$(BASE_SRC_DIR)/%.o: $(BASE_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

$(DECODER_SRC_DIR)/%.o: $(DECODER_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

$(PROCESSOR_SRC_DIR)/%.o: $(PROCESSOR_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

$(QRCODE_SRC_DIR)/%.o: $(QRCODE_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

$(VIDEO_SRC_DIR)/%.o: $(VIDEO_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

$(WINDOW_SRC_DIR)/%.o: $(WINDOW_SRC_DIR)/%.c
	gcc $(CFLAGS) -c -o $@ $^

clean:
	git clean -fxd .
