# Replication Package for `Make Code Green: Evaluating Energy Optimization`
This repository contains the replication package for the study `Make Code Green: Evaluating Energy Optimization`.
This staud establishes an automated pipeline to measure the energy footprint of a large set of Matlab projects mined from GitHub, addressing the growing concern of energy consumption in scientific software systems.
It evaluates whether recent Large Language Models (LLMs) like ChatGPT-3, ChatGPT-4, Mixtral, and LLama can reduce the energy footprints of these software systems, identifying and categorizing 2,176 optimizations suggested by the LLMs.
The study compares LLM-suggested optimizations with human-proposed ones, assesses their impact on code sustainability through statistical analysis.

## Structure
```
READMe.md
RQ1/
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
		
RQ2/
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

RQ3/
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

## Contents of the Replication Package
---
###  `RQ1`
The subfolders `Curation Scripts` and `Entry Point Scripts` have their own `README.md` file for futher explanation.
The scripts of these subfolder create the dataset in `Dataset`: a list of our 100 sampled GitHub projects and a list of their entry points.

### `RQ2/Optimization-results/`:
    - `llama_reasoning.csv`: For llama, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
    - `mixtral_reasoning.csv`: For mixtral, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
    - `gpt-3_reasoning.csv`: For gpt-3, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and themes extracted from each file. 
    - `gpt-4_reasoning.csv`: For gpt-4, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
    - `human_reasoning.csv`: For human optimization, It contains the 60 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
    - `Human-guidelines.txt`: The guidelines for energy optimization formed by the developer.

### `RQ2/Mappings`:
  - `LLM-themes.csv`: Contains the themes extracted from all models and mapped with high-level themes.
  - `Human-themes.csv`:  contains the themes extracted from the guidelines and develoepr experience, mapped also with high-level themes.

### `RQ2/Analysis`:
    - `EnergyThemes.py`: Scripts used to extract themes from the optimization results, merge them together, and at the end plot the results used in the study.
    - `EnergyOptimizationWithAnyScale.py`: Script to prompt the models (mixtral, and llama) and get the optimized code.
    - `EnergyOptimizationWithChatGpt.py`: Script to prompt the models (gpt3, and gpt4) and get the optimized code.

### `RQ3/Optimization-results/`: 
For each model, it contains the files sent to the models for the optimization. The optimized files are stored under the column "optimized-code" in the csv files. 
    - `human/`: Matlab files optimized by human
    - `processed_results/averages_results.csv`: the results collected from the tool for each model and the baseline.

### `RQ3/EnergiBridge-results/`:
    - `output-human.zip`: the results from the EnergiBridge (Energy Profiler) for each file optimized by developer.
    - `output-LLMs.zip`:  the results from the EnergiBridge (Energy Profiler) for each file optimized by LLMs.

### `RQ3/Analysis`:
    - `EnergyProcessorStats.ipynb`: Scripts used to perform stastical tests.
    - `EnergyOptimizationProcessor.py`: Scripts used to process optimization results.
	
### `RQ3/Correctness`:
	- `compareOutputs.m`: Script that compares the behavior (console output, HDD file changes, return result) of original and optimized scripts
	- `two_scripts_are_same.m`: Script called by `compareOutputs.m`
	- `compareOutput.csv`: Result of the comparison in `compareOutputs.m`
