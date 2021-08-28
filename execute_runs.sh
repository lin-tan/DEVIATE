#!/bin/bash
WORKING_DIR=$1
done_filename=$2
queue_filename=$3
no_GPUs=$4

now="$(date +"%y_%m_%d_%H_%M_%S")"
LOG_FILE=$WORKING_DIR"/logs/train_per_epoch_$now.log"

exec &>$LOG_FILE

python execute_runs.py $WORKING_DIR $done_filename $queue_filename $no_GPUs
