#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou
#
# Installs ghcup and Haskell binaries.

set -e

# directory to install ghcup to
GHCUP_DIR=$HOME/.ghcup/bin
mkdir -p $GHCUP_DIR
export PATH="$GHCUP_DIR:$PATH"

# get ghcup
wget https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup -O \
	$GHCUP_DIR/ghcup
chmod +x $GHCUP_DIR/ghcup

# install software
ghcup install ghc
ghcup set ghc
ghcup install cabal
ghcup install hls

# update cabal index
cabal update

# install hpack
cabal install hpack
