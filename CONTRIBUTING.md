# Contributing to Adaptive Power-Aware AI & DSP

Thank you for your interest in contributing! This project aims to push the boundaries of energy-efficient hardware design.

## How to Contribute

1. **Bug Reports**: If you find a bug in the RTL or scripts, please open an issue.
2. **Feature Requests**: If you have ideas for better operand isolation or slack monitoring, feel free to suggest them.
3. **Pull Requests**:
   - Create a feature branch.
   - Ensure all RTL passes functional verification.
   - Include power and timing reports if your changes affect the design's footprint.

## Coding Standards

- **Verilog/SystemVerilog**: Use clear signal names and include comments for complex FSM logic.
- **Python**: Follow PEP8 guidelines for scripts.
- **Documentation**: Update the README if you add new modules or tools.

## Verification Requirements

All contributions must pass the `verification/functional_tests/`.
If the change affects power, please include a report from `scripts/power_estimation.py`.
