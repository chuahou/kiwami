#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

set -e
check-root user || exit 1

curl https://sh.rustup.rs -sSf | sh -s -- -y
