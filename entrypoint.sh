#!/bin/bash
set -e

mkdir input
cp "$INPUT_DISK_IMAGE" input/

MENDER_ARTIFACT_NAME="$INPUT_ARTIFACT_NAME" ./docker-mender-convert \
   --disk-image input/"$INPUT_DISK_IMAGE" \
   --config "${INPUT_CONFIGURATIONS// / --config }" \
   --overlay "$INPUT_OVERLAY"
