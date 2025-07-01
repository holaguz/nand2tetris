# Makefile for Project 01 - Boolean Logic

include ../common.mk

# HDL modules for project 01
MODULES = nand not or xor and mux demux not16 and16 or16 mux16 or8way mux_n_way16 demux_n_way16

# Target 01: build and test all modules
01: $(MODULES)

# Individual module targets
$(MODULES): %: %.sv tb_%.sv
	# @echo "Building and testing $@..."
	@$(MAKE) -f ../common.mk $@

.PHONY: 01 $(MODULES)
