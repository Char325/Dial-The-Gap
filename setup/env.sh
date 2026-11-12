# Source this in every shell and every Slurm job:  source setup/env.sh
# Edit DTG_DATA to a directory with plenty of space (NOT your 20GB home).

export DTG_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DTG_DATA="${DTG_DATA:-$HOME/scratch/dtg}"      # <-- change if your big-storage path differs
export DTG_VENV="${DTG_VENV:-$HOME/venvs/dtg}"
export DTG_RAW="${DTG_RAW:-$HOME/scratch/dtg/raw}" 

# Model downloads go to big storage too, or they will fill your home quota.
export HF_HOME="$DTG_DATA/hf_cache"
export TORCH_HOME="$DTG_DATA/torch_cache"
export PYTHONPATH="$DTG_REPO/src:${PYTHONPATH:-}"

if [ -f "$DTG_VENV/bin/activate" ]; then
  source "$DTG_VENV/bin/activate"
fi
