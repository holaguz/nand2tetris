# Compiler and flags
VERILATOR = verilator
VERILATOR_FLAGS = --cc --binary --timing --assert -Wno-TIMESCALEMOD --MMD

# Directories
BUILD_DIR := $(shell git rev-parse --show-toplevel)/build
OBJ_DIR := $(BUILD_DIR)/obj

# Create build directory
$(BUILD_DIR) $(OBJ_DIR):
	mkdir -p $(BUILD_DIR) $(OBJ_DIR)

# Pattern rule for HDL compilation and testing
# Usage: make <module_name>
%: %.sv tb_%.sv | $(BUILD_DIR) $(OBJ_DIR)
	$(VERILATOR) $(VERILATOR_FLAGS) -Mdir $(OBJ_DIR) --top-module tb_$@ $^ -o $(BUILD_DIR)/tb_$@
	$(BUILD_DIR)/tb_$*
	@printf '\n'

# Clean build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)


-include $(shell find $(OBJ_DIR) -name "*.d" -type f)
