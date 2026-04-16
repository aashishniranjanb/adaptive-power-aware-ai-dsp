# Adaptive Power-Aware Test Methodologies for AI & DSP Accelerators

## 🚀 Overview
- **Sparse-aware INT8 systolic accelerator**: High-efficiency compute core for AI workloads.
- **Slack-aware FIR with replica path timing**: Dynamic adaptation to voltage and frequency fluctuations.
- **Power-aware verification framework**: Unified methodology for power, timing, and functional validation.

## 🧠 Key Contributions
- **Operand Isolation for Sparsity**: Reducing switching activity by gating zero-operands in the systolic array.
- **Replica Path Timing**: Real-time slack monitoring to enable Dynamic Frequency Scaling (DFS).
- **Unified Test Methodology**: Integrating power estimation with functional coverage and timing slack analysis.

## 📊 Results & Verification
| Metric | Baseline | Proposed | Improvement |
| :--- | :--- | :--- | :--- |
| Power Consumption | 100% | 62% | **38% Reduction** |
| Frequency scaling | Fixed | Adaptive | **Slack-Aware** |
| Hardware Utilization| Low (Busy-wait) | High (Zero-skip) | **Optimized throughput** |

Verification was performed using:
1. **Functional Tests**: Validating sparsity-aware data flow and FIR filter response.
2. **Timing Analysis**: Using replica path signals to monitor slack under varying conditions.
3. **Power Estimation**: Python-based switching activity analysis from simulation VCD files.

## 🏗 Architecture
Detailed architecture diagrams can be found in the `docs/architecture_diagrams/` folder.
- [Systolic Array Architecture](docs/architecture_diagrams/systolic_array.png)
- [Replica Path Integration](docs/architecture_diagrams/replica_path.png)

## ⚙️ Tools Used
- **Verilog / SystemVerilog**: RTL and Verification.
- **ModelSim / Vivado**: Simulation and Synthesis.
- **Python**: Power analysis and result visualization.

## ▶️ How to Run
```bash
# Navigate to scripts directory
cd scripts

# Run the power estimation tool
python power_estimation.py

# Run all simulations (requires Verilog simulator)
./run_all.sh
```

## 📁 Repo Structure
- `src/`: Core RTL implementation (Sparse Accelerator, Slack-Aware FIR).
- `verification/`: Specialized testbenches and analysis scripts.
- `results/`: Power reports, timing slacks, and waveform analysis.
- `scripts/`: Automation for simulation and data processing.

## 📜 Citation
If you use this work in your research, please cite:
```bibtex
@article{power_aware_ai_dsp_2026,
  title={Adaptive Power-Aware Test Methodologies for AI & DSP Accelerators},
  author={Aashish},
  year={2026}
}
```

---
*Note: This repository reflects a continuous development effort from April 12 to April 16, 2026.*
