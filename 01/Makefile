# Makefile for Project 01 - Boolean Logic

include ../common.mk

MODULES := nand not or xor and mux demux not16 and16 or16 mux16 or8way mux_n_way16 demux_n_way16

.PHONY: 01
01: $(MODULES)

.PHONY: $(MODULES)
$(MODULES):
	@$(MAKE) -f ../common.mk $@
