CXX = g++
CXXFLAGS = -g -no-pie
AS = nasm
ASFLAGS_ELF = -f elf64 -g -F dwarf
ASFLAGS_BIN = -f bin

BUILD_DIR = build
APP_DIR = app
BOOT_DIR = boot

CPP_SRCS = $(wildcard $(APP_DIR)/*.cpp)
APP_ASM_SRCS = $(wildcard $(APP_DIR)/*.asm)

BOOT_SRCS = $(wildcard $(BOOT_DIR)/*.asm)

OBJS = $(patsubst $(APP_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(CPP_SRCS)) \
       $(patsubst $(APP_DIR)/%.asm, $(BUILD_DIR)/%.o, $(APP_ASM_SRCS))
       
BOOT_BINS = $(patsubst $(BOOT_DIR)/%.asm, $(BUILD_DIR)/%.bin, $(BOOT_SRCS))

APP = $(BUILD_DIR)/app.out

.PHONY: all clean prep

all: prep $(APP) $(BOOT_BINS)

prep:
	@mkdir -p $(BUILD_DIR)

# Link
$(APP): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

# app/*.cpp
$(BUILD_DIR)/%.o: $(APP_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# app/*.asm
$(BUILD_DIR)/%.o: $(APP_DIR)/%.asm
	$(AS) $(ASFLAGS_ELF) $< -o $@

# boot/*.asm
$(BUILD_DIR)/%.bin: $(BOOT_DIR)/%.asm
	$(AS) $(ASFLAGS_BIN) $< -o $@

clean:
	rm -rf $(BUILD_DIR)