# DEVIATE is the variance testing tool for machine learning system.

## Summary
Deep learning (DL) training is nondeterministic: both the DL algorithm and DL software implementation introduce nondeterminism to improvetraining  efficiency  and  model  accuracy.    Prior work shows  that both types  of nondeterminismcause significant variance of model accuracy (upto  10.8%)  and  training  time  between  identicaltraining runs.  Such variance may affect the validity of new DL techniques proposed in the research community and the validity of the comparison  results  with  baselines.   To  ensure  such validity,  DL  researchers  and  practitioners  must replicate  their  experiments  multiple  times  withidentical settings to quantify the variance of the proposed approaches and baselines.  Replicatingand  measuring  DL  variances  reliably  and  efficiently is challenging and understudied. We propose a ready-to-deploy framework DEVIATE  that  (1)  measures  DL  training  variance  ofa  DL  model  with  minimal  manual  efforts,  and (2) provides statistical tests of both accuracy andvariance.  Specifically, DEVIATE automatically analyzes the DL training code and extracts monitored  important  metrics  (such  as  accuracy  and loss).   In addition,  DEVIATE performs popular statistical tests and provides users with a report of statistical p-values and effect sizes along with various confidence levels when comparing to selected baselines.

## Demo Video
We have a [demo video](youtube.com/watch?v=OjOkLMlMt08) of the tool where we show some usage of the DEVIATE on the sample project.

## Usage

### Dependencies and requirements:

DEVIATE requires the following:

1. System with Linux OS, preferably Ubuntu 16.04 or later
2. Python 3.6 or conda enviroment as specified by **deviate.yml**
3. Docker with GPU support
4. Experiment source code written in python


### Sample adversarial experiment:

This is the adversarial training project described in the paper. The source code is under **sample_project/fast_cifar10**.
To create the docker image to run this experiment:

1. Download the three parts of the tar file that contain the Docker image from these links [part1](https://github.com/hvpham/deviate/releases/download/v0.1/cifar10_challenge.tar.partaa), [part2](https://github.com/hvpham/deviate/releases/download/v0.1/cifar10_challenge.tar.partab), and [part3](https://github.com/hvpham/deviate/releases/download/v0.1/cifar10_challenge.tar.partac)
2. `cd` to the download folder
3. Merge the part using `cat cifar10_challenge.tar.parta* > cifar10_challenge.tar`
4. Load the image using `docker load --input cifar10_challenge.tar`


### Start DEVIATE:

Steps to start using DEVIATE

0. Activate the deviate conda enviroment if applicable (the one created using **deviate.yml**)
1. Start DEVIATE using `python deviate.py` from DEVIATE folder. If using the conda enviroment then activate the enviroment first.
2. In the first start DEVIATE will ask for a **working directory** to save all DEVIATE's data including configuration files, replicated runs' data, and any analysis results.
3. DEVIATE will display any existing experiments and give the user option 
    * **a**: Add a new experiment
    * **v**: View existing experiment
    * **c**: Perform comparision if there are more than 1 experiment
    * **n**: Exit DEVIATE


### Create experiment:

To add a new experiment DEVIATE requires the following information.
We give example based on the sample adversarial training project described earlier and **$DEVIATE_HOME** is the location of Deviate source folder.

1. **id**: An unique ID of the experiment that would be used in analysis later. User should choose this id to be descriptive enough to differentiate the experiments.
2. **description**: A short description of the experiment
3. **no_tries**: The number of replication of the experiment
4. **source_dir**: The full absolute path to the source directory that contain the experiment code (e.g., `$DEVIATE_HOME/sample_project/fast_cifar10`)
5. **train_file**: The training source code file that DEVIATE can analyze and extract metrics to be monitored (e.g., `train.py`)
6. **train_command**: The command to execute the training (e.g., `python train.py RN32 FGSM` to train Resnet32 with FGSM attack)
7. **eval_file**: An optional evaluation source code file that can evaluate the trained models
8. **eval_command**: A list of optional evaluation commands to evaluate the trained models
9. **docker_env**: The docker image that can be used to execute the training and evaluation (e.g., `cifar10_challenge`)

### Modify the the source code and start the runs

The added experiment will appear in the list of existing experiments.

1. Select to view the details of the new experiment
2. DEVIATE give users some options:
   * **v**: View the progress of the run if the runs are not completed yet
   * **e**: Edit the experiment (e.g., add more replication runs, change/add experiment commmand)
   * **x**: Extract the metrics and modify the source code
   * **s**: Shedule the experimental runs
   * **a**: Analyze the variance of the experiment
   * **n**: Exit to main menu
3. For a newly created experiment, the user should select **x** to extract the metrics amd modify the source code. Follow the prompts to inspect the extracted metrics and make appropriate modification if necessary.
4. Once the source code files are modified, the user should select **s** to schedule the runs.
5. The user could monitor the status of the run using the **v** option.

### Variance analysis and perform comparision

DEVIATE can peform variance analysis of a single experinence

1. Once the runs are completed, the user could perform variance analysis using the **a** option in the experiment view. DEVIATE will inform the user with the location of the analysis result once this is done.

DEVIATE also performs comparision between different experiments and provide statistical test to comfirm if the comparision are significant.

1. To do this, select **c** in the main menu to perform comparision
2. To add a new comparision DEVIATE requires the following information:
    1. **id**: An unique ID of the comparision.
    2. **description**: A short description of the comparision
    3. **experiment_1**: The id of the first experiment
    3. **experiment_2**: The id of the second experiment
3. To perform the comparision, select **c** and then index of the comparision, DEVIATE will inform the user with the location of the comparision result
