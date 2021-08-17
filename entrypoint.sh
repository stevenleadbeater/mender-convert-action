#!/bin/bash
set -e

mkdir input
cp "$INPUT_DISK_IMAGE" input/

MENDER_ARTIFACT_NAME="$INPUT_ARTIFACT_NAME" ./mender-convert \
   --disk-image input/"$INPUT_DISK_IMAGE" \
   --config "${INPUT_CONFIGURATIONS// / --config }" \
   --overlay "$INPUT_OVERLAY"

mender-cli login \
  --server "$INPUT_SERVER_ADDRESS" \
  --username "$INPUT_USERNAME" \
  --password "$INPUT_PASSWORD"

mender-cli artifacts \
  --server "$INPUT_SERVER_ADDRESS" \
  upload \
  "$INPUT_ARTIFACT_NAME".mender