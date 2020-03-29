#!/usr/bin/env bash
set -e

export imageName='convert3D_1p0p0'

source main_setup.sh

neurodocker generate ${neurodocker_buildMode} \
   --base debian:stretch \
   --pkg-manager apt \
   --run="printf '#!/bin/bash\nls -la' > /usr/bin/ll" \
   --run="chmod +x /usr/bin/ll" \
   --run="mkdir ${mountPointList}" \
   --convert3D version=1.0.0 \
   --env DEPLOY_PATH=/opt/convert3D-1.0.0/bin/ \
   --user=neuro \
  > recipe.${imageName}

./main_build.sh
