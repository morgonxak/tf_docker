#!/bin/bash

IMAGE_NAME=nn_tf:latest
CONTAINER_NAME=nn_tf_gpu
DATADIR="$HOME/projects"
DATASET_DIR="/mnt/md0/dicom"
PORT=8080

docker rm "$CONTAINER_NAME" -f

docker run --name "$CONTAINER_NAME" -t -d \
	 --gpus '"device=2"' \
	 --cpus=8 \
     --memory 64G \
     -p 8080:$PORT \
     -e DISPLAY=$DISPLAY \
     --volume="$DATADIR:/home/projects" \
     --volume="$DATASET_DIR:/home/dataset" \
     --cap-add SYS_ADMIN  \
     --cap-add DAC_READ_SEARCH \
     "$IMAGE_NAME" \
     jupyter-lab --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password='' --ip='0.0.0.0' --port=$PORT
