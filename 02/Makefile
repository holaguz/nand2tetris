# Makefile for Project 02 - Boolean Arithmetic

include ../common.mk

MODULES := half_adder full_adder adder_16 inc_16 alu

# Target 02: build and test all modules
02: $(MODULES)

# Individual module targets
$(MODULES): %: %.sv tb_%.sv
	# @echo "Building and testing $@..."
	@$(MAKE) -f ../common.mk $@

.PHONY: 02 $(MODULES)
