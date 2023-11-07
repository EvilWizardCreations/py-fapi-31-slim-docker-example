#!/bin/bash
# USAGE:
# build-up-py-fapi-31-slim.sh
#
# NOTE:
# Rebuild the Docker image & compose up.

# source the environment variables
set -o allexport; source "${PWD}/.env"; set +o allexport

# Use the EWC Protocol to build the image of the service & compose up
ewc-docker-build-up.sh "py-fapi-31-slim" "${PY_FAPI_31_SLIM_DOCKER_BUILD_DESC:-Python FastAPI Webapp}"
