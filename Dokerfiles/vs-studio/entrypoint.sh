#!/bin/bash

sudo usermod -d "${HOME}" "${USER}"

dumb-init code-server \
          --config /opt/code-server/config/config.yaml \
          --user-data-dir /opt/code-server/user-data