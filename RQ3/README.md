# Replication Package for `Make Code Green: Evaluating Energy Optimization`

## Structure
```
RQ3/
	README.md
	Optimization-results/
		llama_optimization.csv
		mixtral_optimization.csv
		gpt-3_optimization.csv
		gpt-4_optimization.csv
		human/
		processed_results/
	EnergiBridge-results/
		output-human.zip
		output-LLMs.zip
	Analysis/
		EnergyProcessorStats.ipynb
		EnergyOptimizationProcessor.py
	Correctness/
		compareOutputs.m
		two_scripts_are_same.m
		compareOutput.csv

```

### README.md 
- The docker image is run on our university's server with configuration: 
```
CPU: AMD Ryzen 9 7900X, 
GPU: MSI Geforce RTX 4090 VENTUS 3X 24G OC,
RAM: Corsair DDR5 Vengeance 2×32GB 5600,
DISK: Crucial P3 Plus 4TB M.2 SSD,
Motherboard: Asrock X670E Pro RS,
CPU coller: DeepCool LT720
Case: Fractal Design Meshify 2 XL Black TG Dark Tint
Powersupply: MSI MPG A1000G PCIE5 PSU PC voeding.
```
`
