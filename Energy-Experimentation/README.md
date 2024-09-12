Here we provide the environement (code, and files) to run and measure the energy consumption of Matlab scripts. We used this pipeline for our study presenting in `Make Code Green: Evaluating Energy Optimization`.


## Installation

### Requirements

To run the pipeline, you will need python and some python libraries:
```
python3
tqdm
```
### Energy profiler: EnergiBridge

For the energy profiler, we use EnergiBridge. To install it, please follow the instructions on their official repository, as you may need to perform different prerequisites depending on your platform: https://github.com/tdurieux/EnergiBridge

Then, indicate the path of the Energibridge executable in the `measure.py` script by changing the value of the variable `PATH_TO_ENERGIBRIDGE_BINARY` in line 31.

### Docker

To isolate the execution of the Matlab script, we execute the script inside a docker container. We created a dedicated Dockerfile that allows to download all the common Matlab toolboxes (i.e., libraries). 

Build the docker image with the following command:
`docker build -t matlab-r2021b-toolbox .`

You can also change the name of the docker image if you would like with the `-t` option. If you do so, please make sure you update the value of the variable `NAME_DOCKER_IMAGE` in line 33 of the script `measure.py`.

### Matlab projects

Download the Matlab projects you would like to evaluate in the `sampling` folder.

In our study, the matlab projects were downloaded from GitHub by running the Matlab scripts in `RQ1/Curation Scripts`. The entry points files of those Matlab projects were then determined with running the script in `RQ1/Entry Point Scripts`.


### Scripts to execute

A file containing the list of the paths to scripts to run (and to measure the enrgy consumption of). The format must follow the 1 line = 1 script. 
As example, the file used to run the Matlab entrypoint files (i.e., original scripts and corresponding LLM optimised scripts) from our study is provided in the `experimentation` folder as `Experimentation_scripts.csv`. It contains relative paths to the `sampling` folder where the Matlab projects were located.
We used the list of entrypoints found previously (and the generated LLMs optimised corresponding scripts) to then create our `Experimentation_scripts.csv` file.

## Running the experimentation

In `measure.py` line 32, update the `PATH_TO_PROJECT_FOLDER` variable with the absolute path to this specific folder `Energy-Experimentation`.

To launch the experimentation, i.e., running the Matlab scripts and measuring their energy consumption:

`python3 measure.py -f <path/to/file_of_scripts_to_execute.txt> -rep <interger>`

Options:
- `-f` path to the file listing all the Matlab script to execute
- `-rep` number of repetitions to execute each Matlabe script

Example: `python3 measure.py -f Experimentation_human_scripts.csv -rep 30`

Output:
Two files will be produced for each Matlab script (`XXXXXX` represents the name of the Matlab script executed, and `ZZ` is the number of the replication): 
- `output_simulation_XXXXXX_ZZ.txt`: contains any output the Matlab script produces.
- `energy_metrics_XXXXXXXX_ZZ.csv`: contains the values of the energy measurements done during the execution of the Matlab script.

The files are generated in the `output` folder.
