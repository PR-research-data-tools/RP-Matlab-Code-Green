# Replication Package for `Can We Make Code Green? Understanding Trade-Offs in LLMs vs. Human Code Optimizations`
This repository contains the replication package for the study `Can We Make Code Green? Understanding Trade-Offs in LLMs vs. Human Code Optimizations`.
In this work, we explore the efficacy of LLMs in reducing the environmental footprint of Matlab scripts mined from GitHub projects, addressing the growing concern of energy consumption.
We investigate potential energy optimizations recommended by leading LLMs, such as GPT-3, GPT-4, Llama, and Mixtral, as well as an expert developer. 
From 400 entry-point scripts across 100 top Matlab projects, we identified 2,176 unique LLM optimizations mapped to 13 high-level themes.
We evaluate the effects of their optimizations on Matlab code's green capacity (changes in energy consumption, memory usage, execution time consumption, and code correctness).

## Structure
```
README.md

Energy-Pipeline/
	README.md
	Dockerfile.toolbox
	output/
	sampling/
	src/
Data-Collection/
	Curation Scripts/
		clone.py
		filter.py
		refiner.py
		sampler.py
		README.md
	Entry Point Scripts/
		entryPoints.m
		README.md
	Dataset/
		entrypoints_no_crashes_only.csv
		projects_filtered_top100stars.csv
		
RQ1/
	Optimization-reasonings/
		llama_reasoning.csv
		mixtral_reasoning.csv
		gpt-3_reasoning.csv
		gpt-4_reasoning.csv
		human_reasoning.csv
		Human-guidelines.txt
	Mappings
		LLM-themes.csv
		Human-themes.csv
	Analysis/
		EnergyThemes.py
		EnergyOptimizationWithAnyScale.py
		EnergyOptimizationWithChatGpt.py

RQ2/
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
		Energy_Time-Tradeoff_with_quartiles.csv
		EnergyProcessorStats.ipynb
		EnergyOptimizationProcessor.py
		correlation_matrix.pdf
		effect_sizes_comparison.pdf
	Correctness/
		compareOutputs.m
		two_scripts_are_same.m
		compareOutput.csv
```

## Contents of the Replication Package
---
###  `Energy-Pipeline`
It provides the pipeline or environment (code and files) for the tool EnergiBridge, which runs and measures the energy consumption of Matlab scripts used in our study.
- `README.md`: Describe the content of this folder.
- `Dockerfile.toolbox`:  Docker file to isolate the execution of Matlab scripts.
- `sampling/`: Clonned GitHub projects are expected to be evaluated.
- `output/`: Output files from the tool from the experimentation will be stored here.
- `src/`: Original and Optimized version of the files that need to be measured. 
    
###  `Data-Collection`
The subfolders `Curation Scripts` and `Entry Point Scripts` have their own `README.md` file for further explanation.
The scripts of these subfolders create the dataset in `Dataset`: a list of our 100 sampled GitHub projects and a list of their entry points.

### `RQ1/Optimization-results/`:
- `llama_reasoning.csv`: For llama, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
- `mixtral_reasoning.csv`: For mixtral, it contains 400 files, including the original code, optimized code, reasoning (optimization applied) for each file, and themes extracted from each file. 
- `gpt-3_reasoning.csv`: For gpt-3, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and themes extracted from each file. 
- `gpt-4_reasoning.csv`: For gpt-4, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
- `human_reasoning.csv`: For human optimization, It contains the 60 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
- `Human-guidelines.txt`: The developer formed the guidelines for energy optimization.

### `RQ1/Mappings/`:
- `LLM-themes.csv`: Contains the themes extracted from all models and mapped with high-level themes.
- `Human-themes.csv`:  contains the themes extracted from the guidelines and developer experience, also mapped with high-level themes.

### `RQ1/Analysis/`:
- `EnergyThemes.py`: Scripts used to extract themes from the optimization results, merge them, and, in the end, plot the results used in the study.
- `EnergyOptimizationWithAnyScale.py`: Script to prompt the models (mixtral, and llama) and get the optimized code.
- `EnergyOptimizationWithChatGpt.py`: Script to prompt the models (gpt3, and gpt4) and get the optimized code.

### `RQ2/Optimization-results/`: 
For each model, it contains the files sent to the models for the optimization. The optimized files are stored under the column "optimized-code" in the csv files. 
- `human/`: Matlab files optimized by human
- `processed_results/averages_results.csv`: the results collected from the tool for each model and the baseline.

### `RQ2/EnergiBridge-results/`:
- `output-human.zip`: the results from the EnergiBridge (Energy Profiler) for each file optimized by the developer.
- `output-LLMs.zip`:  the results from the EnergiBridge (Energy Profiler) for each file optimized by LLMs.

### `RQ2/Analysis`:
- `EnergyProcessorStats.ipynb`: Scripts used to perform statistical tests.
- `EnergyOptimizationProcessor.py`: Scripts used to process optimization results.
- `correlation_matrix.pdf`: resulting from correlation analysis.
- `effect_sizes_comparison.pdf`: effect sizes measuring for the statistical test.
- `Energy_Time-Tradeoff_with_quartiles.csv`: CSV containing the scripts analyzed for trade-off analysis
	
### `RQ2/Correctness`:
- `compareOutputs.m`: Script that compares the behavior (console output, HDD file changes, return result) of original and optimized scripts
- `two_scripts_are_same.m`: Script called by `compareOutputs.m`
- `compareOutput.csv`: Result of the comparison in `compareOutputs.m`
