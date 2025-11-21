#!/bin/bash


export PATH=$PATH:/workspaces/fusesoc-fifo-lib/oss-cad-suite/bin

set -ex

sby -f formal.sby bmc
sby -f formal.sby prove
sby -f formal.sby cover
