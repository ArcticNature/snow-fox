#!/bin/bash
# Wrapper command to run a snow-fox daemon instance for development.


BIN="out/dist/debug/core/bin/daemon/core.bin.daemon"
REPO="config-example"

BASE_SOCK="/tmp/snow-fox"
M_SOCK="${BASE_SOCK}-manager.sock"
SM_SOCK="${BASE_SOCK}-spawner-manager.sock"
S_SOCK="${BASE_SOCK}-spawner.sock"


${BIN} \
  --nodaemonise \
  --repo_path "${REPO}" \
  --manager_socket "${M_SOCK}" \
  --spawner_manager_socket "${SM_SOCK}" \
  --spawner_socket "${S_SOCK}"
