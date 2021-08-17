# GitHub Action for building mender compatible dual file system images

Build a .deb package for deploying to hosted or OS mender.io

## Inputs

### `artifact_name`:
**Required** Name of the artifact to produce from the golden image
### `disk_image`
**Required** The image file to be converted
### `configurations`
**Required** Space delimited list of the configurations to use with the converter. See https://docs.mender.io/3.0/system-updates-debian-family/convert-a-mender-debian-image/customization
### `overlay`
**Required** The "rootfs-overlay" is a method for providing new and modified files to appear in the output image without needing to modify the input image. See https://docs.mender.io/3.0/system-updates-debian-family/convert-a-mender-debian-image/customization#rootfs-overlays
### `server_address`
**Required** Address of the mender server to upload to (defaults to https://hosted.mender.io)
### `username`
**Required** Username on the server specified in the server_address
### `password`
**Required** Password for the user on the server specified in the server_address

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE-MIT.txt).

