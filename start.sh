#!/bin/bash
set -eux
babeld -c babeld.conf eth0 &
RUST_LOG=INFO RUST_BACKTRACE=FULL rita_exit --config=rita_exit.toml
