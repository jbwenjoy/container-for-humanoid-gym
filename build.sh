#!/bin/bash

# Same as IsaacGym Preview 4's script (https://developer.nvidia.com/isaac-gym).

set -e
set -u
SCRIPTROOT="$( cd "$(dirname "$0")" ; pwd -P )"
cd "${SCRIPTROOT}/.."

docker build --network host -t isaacgym -f docker/Dockerfile .
