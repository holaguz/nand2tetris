.PHONY: 01
01:
	$(MAKE) -C 01/ 01

.PHONY: format
format:
	verible-verilog-format --inplace $(shell find -name "*.sv")
