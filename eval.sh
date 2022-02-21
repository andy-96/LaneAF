#!/bin/bash

LIST_FILE_PATH=/home/andy/Code/md2-laneaf/splits/test_lanes/bdd100k_highway/test_lanes_culane-eval.txt
DATA_DIR=/home/andy/data/bdd100k/data
OUTPUT_PATH=experiments/culane/2022-02-21-19:00-infer/eval_results.txt
DETECT_DIR=experiments/culane/2022-02-21-19:00-infer/outputs
FILE_EXTENSION=.lines.txt

echo "LIST FILE PATH    = ${LIST_FILE_PATH}"
echo "DATA DIR          = ${DATA_DIR}"
echo "DETECT DIR        = ${DETECT_DIR}"
echo "OUTPUT PATH       = ${OUTPUT_PATH}"
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 "$1"
fi

w_lane=30;
iou=0.5;  # Set iou to 0.3 or 0.5
im_w=1280
im_h=720
frame=1
list=$LIST_FILE_PATH
out=$OUTPUT_PATH
/home/andy/Code/md2-laneaf/evaluation/CULane/evaluate -a $DATA_DIR -d $DETECT_DIR -i $DATA_DIR -l $list -w $w_lane -t $iou -c $im_w -r $im_h -f $frame -o $out -e $FILE_EXTENSION