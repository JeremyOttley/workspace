#!/usr/bin/env bash

set -Eeuxo pipefail

IFS=$'\n\t'

trap 'echo Error at about $LINENO' ERR

