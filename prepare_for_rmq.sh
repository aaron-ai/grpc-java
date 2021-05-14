#!/bin/bash

set -e

function install_dependency() {
  gradle clean publishToMavenLocal -PskipAndroid=true -PskipCodegen=true
}

ALL_SUB_PROJECTS='api context core netty netty/shaded stub protobuf protobuf-lite'

BASE_DIR=$(
  cd "$(dirname "$0")" || exit 1
  pwd
)

for project in $ALL_SUB_PROJECTS; do
  echo "================== current module: $project =================="
  cd "${BASE_DIR}/${project}" || exit 1
  install_dependency
done
