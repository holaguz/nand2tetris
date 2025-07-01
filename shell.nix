{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # HDL Simulation
    iverilog
    verilog # Icarus Verilog simulator
    verilator # Fast C++ simulation
    gtkwave # Waveform viewer GUI
    verible

    # Synthesis and Place & Route
    yosys # Synthesis
    nextpnr # Place and route

    # RISC-V Toolchain
    pkgsCross.riscv64.buildPackages.gcc
    pkgsCross.riscv64.buildPackages.binutils

    # Development Tools
    gnumake # Build automation
    cmake # Alternative build system
    pkg-config # Library discovery

    # Text Processing
    ripgrep # Fast grep for code search
    fd # Fast find alternative

    # Version Control
    git # Essential for project management

    # Optional: Additional utilities
    xxd # Hex dump for binary inspection
    python3 # Scripting and test automation
  ];

  shellHook = ''
    echo "RISC-V Development Environment"
    echo "=============================="
    echo "Available tools:"
    echo "  iverilog  - Verilog simulation"
    echo "  verilator - Fast C++ simulation" 
    echo "  gtkwave   - Waveform viewer"
    echo "  yosys     - Synthesis"
    echo "  nextpnr   - Place and route"
    echo ""
    echo "RISC-V cross-compiler available as:"
    echo "  riscv64-unknown-linux-gnu-gcc"
    echo "  riscv64-unknown-linux-gnu-as"
    echo ""
    echo "Example workflow:"
    echo "  iverilog -o sim design.v testbench.v"
    echo "  ./sim"
    echo "  gtkwave dump.vcd"
    echo ""

    # Set up environment variables
    export RISCV_PREFIX="riscv64-unknown-linux-gnu-"
  '';
}
