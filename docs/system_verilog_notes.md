# Bit vs logic

bit - 2-state type (0, 1 only)
logic - 4-state type (0, 1, X, Z)
Key differences:
State representation:

bit: Only 0 and 1 values
logic: 0, 1, X (unknown), Z (high-impedance)

Initialization:

bit: Always initializes to 0
logic: Initializes to X

Use cases:

bit: Testbenches, behavioral modeling, software-like constructs
logic: Hardware modeling, synthesis, anything requiring X/Z states

Synthesis:

bit: Can synthesize but loses X/Z information
logic: Standard for synthesizable RTL
