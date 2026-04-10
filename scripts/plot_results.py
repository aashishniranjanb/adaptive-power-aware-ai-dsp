import matplotlib.pyplot as plt
import os

def plot_power_comparison():
    labels = ['Baseline (Dense)', 'Proposed (Sparse-Aware)']
    power_values = [100, 62]  # Example data
    
    plt.figure(figsize=(8, 6))
    bars = plt.bar(labels, power_values, color=['#7f8c8d', '#27ae60'])
    
    plt.ylabel('Power Consumption (Normalized %)')
    plt.title('Power Savings: Operand Isolation Performance')
    
    # Add values on top of bars
    for bar in bars:
        yval = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2, yval + 1, f'{yval}%', ha='center', fontweight='bold')
    
    output_dir = "../results/comparison_tables"
    os.makedirs(output_dir, exist_ok=True)
    plt.savefig(os.path.join(output_dir, 'power_comparison.png'))
    print(f"Generated plot: {output_dir}/power_comparison.png")

def main():
    print("--- Results Visualization Engine ---")
    try:
        plot_power_comparison()
    except Exception as e:
        print(f"Warning: Could not generate plot (Missing matplotlib). Error: {e}")
        print("Note: In a headless environment, ensure 'Agg' backend is used.")

if __name__ == "__main__":
    main()
