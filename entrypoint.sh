#!/bin/bash
set -e

rm -r tmp | true
git clone https://github.com/mendersoftware/mender-convert.git
mkdir tmp | true
mv mender-convert/* tmp
rm -r mender-convert
mv tmp/* .
rm -r tmp

sudo rm -rf input | true

sudo MENDER_ARTIFACT_NAME="$INPUT_ARTIFACT_NAME" ./mender-convert \
   --disk-image "$INPUT_DISK_IMAGE" \
   --config ${INPUT_CONFIGURATIONS// / --config } \
   --overlay "$INPUT_OVERLAY"

mender-cli login \
  --server "$INPUT_SERVER_ADDRESS" \
  --username "$INPUT_USERNAME" \
  --password "$INPUT_PASSWORD"

mender-cli artifacts \
  --server "$INPUT_SERVER_ADDRESS" \
  upload \
  "$INPUT_ARTIFACT_NAME".mender