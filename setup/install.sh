#!/bin/bash
# One-time setup on Oscar. Run from the repo root on a login node:
#   bash setup/install.sh
# Uses a plain Python venv (Oscar's recommended route for pip workflows).
# If the system python3 is too old (<3.10), load a newer one first:
#   module avail python      # pick one, e.g. module load python/3.11.x
set -euo pipefail
source "$(dirname "$0")/env.sh"

mkdir -p "$DTG_DATA" "$HF_HOME" "$TORCH_HOME"
PY="${PYTHON:-python3}"
echo "Using $($PY -V) to create venv at $DTG_VENV"

$PY -m venv "$DTG_VENV"
source "$DTG_VENV/bin/activate"
pip install --upgrade pip
pip install -r "$DTG_REPO/requirements.txt"

python -c "import torch; print('torch', torch.__version__, 'cuda build:', torch.version.cuda)"
echo "Done. In new shells run: source setup/env.sh"
