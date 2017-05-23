#!/bin/bash
# Creates a directory with symlinks to all the required files and submodules
# to allow development without having to commit every change for it to be
# part of the full system.


ORG_DIR=${PWD}
DEV_DIR=${1:-"snow-fox-dev"}


mk_build_symlink() {
  name=$1
  if [ ! -h "${DEV_DIR}/$name" ]; then
    ln -s "${ORG_DIR}/build-tools/$name" "${DEV_DIR}/$name"
  fi
}

mk_component_symlink() {
  name=$1
  if [ ! -h "${DEV_DIR}/$name" ]; then
    ln -s "${ORG_DIR}/$name" "${DEV_DIR}/$name"
  fi
}

mk_snow_symlink() {
  name=$1
  if [ ! -h "${DEV_DIR}/$name" ]; then
    ln -s "${ORG_DIR}/snow-fox/$name" "${DEV_DIR}/$name"
  fi
}


# Check directory and build files.
[ -d "${DEV_DIR}" ] || mkdir -p ${DEV_DIR}
mk_build_symlink Gruntfile.js
mk_build_symlink package.json
mk_snow_symlink .git
mk_snow_symlink 3rd-parties
mk_snow_symlink distribution.json
mk_snow_symlink dev-tools

# Check internal components.
mk_component_symlink build-tools
mk_component_symlink config-example
mk_component_symlink core
mk_component_symlink dependencies
mk_component_symlink documents
mk_component_symlink extentions


# Install build-tools node modules.
# And do it twice:
#  - In ${DEV_DIR}/build-tools install all deps.
#  - In ${DEV_DIR} for grunt to work.
# This is required because node looks for node_modules from the absolute path
# of the file calling require and that would skip the symlink.
cd "${DEV_DIR}/build-tools"
npm install

cd ".."
if [ ! -h "node_modules" ]; then
  ln -s "build-tools/node_modules" "node_modules"
fi
