# Makefile for Project 03 - Memory

include ../common.mk

MODULES := dff

# Target 03: build and test all modules
03: $(MODULES)

# Individual module targets
$(MODULES): %: %.sv tb_%.sv
	# @echo "Building and testing $@..."
	@$(MAKE) -f ../common.mk $@

.PHONY: 03 $(MODULES)
