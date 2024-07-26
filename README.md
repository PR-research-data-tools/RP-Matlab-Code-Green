# Replication Package for ``Make Code Green: Evaluating Energy Optimization''
This repository contains the replication package for the study `Make Code Green: Evaluating Energy Optimization`.
This staud establishes an automated pipeline to measure the energy footprint of a large set of Matlab projects mined from GitHub, addressing the growing concern of energy consumption in scientific software systems.
It evaluates whether recent Large Language Models (LLMs) like ChatGPT-3, ChatGPT-4, Mixtral, and LLama can reduce the energy footprints of these software systems, identifying and categorizing 2,176 optimizations suggested by the LLMs.
The study compares LLM-suggested optimizations with human-proposed ones, assesses their impact on code sustainability through statistical analysis.

## Structure
```
RQ1/
    READMe.md
    Dataset

RQ2/
  Optimization-results/
    llama/reasoning.csv
    mixtral/reasoning.csv
    gpt-3/reasoning.csv
    gpt-4/reasoning.csv
    human/reasoning.csv
  Mappings
    LLM-themes.csv
    Human-themes.csv
  Analysis/
    EnergyThemes.py

RQ3/
  Optimization-results/
    llama/
    mixtral
    gpt-3/
    gpt-4/
    human/
Analysis/


```

## Contents of the Replication Package
---
###  `RQ1/Dataset'
It contains the links to the top github repositories

### `RQ2/Optimization-results/':
`llama/reasoning.csv': For llama, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
`mixtral/reasoning.csv': For mixtral, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
`gpt-3/reasoning.csv': For gpt-3, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and themes extracted from each file. 
`gpt4/reasoning.csv': For gpt-4, It contains the 400 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 
`huamn/reasoning.csv': For human optimization, It contains the 60 files, with the original code, optimized code, the reasoning (optimization applied) for each file, and the themes extracted from each file. 

### `RQ2/Mappings':
  `LLM-themes.csv': Contains the themes extracted from all models and mapped with high-level themes.
  `Human-themes.csv':  contains the themes extracted from the guidelines and develoepr experience, mapped also with high-level themes.

### `RQ2/Analysis'
`EnergyThemes.py': Scripts used to extract themes from the optimization results, merge them together, and at the end plot the results used in the study.

### `RQ3/Optimization-results/': 
For each model, it contains the files sent to the models for the optimization. The optimized files are stored under the column "optimized-code". 

### `RQ3/Analysis'
`EnergyProcessor.py': Scripts used to perform stastical tests.
