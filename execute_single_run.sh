#!/bin/bash

COMMAND=${1}
LOG_FILE=${2}

#export TORCH_HOME="/working/torch_home"

cd /working

exec &>$LOG_FILE

#conda activate $ENV
eval $COMMAND
#conda deactivate

chmod 777 -R /working/*