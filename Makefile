default: 01 02

.PHONY: 01
01:
	$(MAKE) -C 01/ 01

.PHONY: 02
02:
	$(MAKE) -C 02/ 02

.PHONY: format
format:
	verible-verilog-format --inplace $(shell find -name "*.sv")
