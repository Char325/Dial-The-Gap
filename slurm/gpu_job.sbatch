#!/bin/bash
# Template GPU job for Oscar. Copy and edit per experiment, then: sbatch slurm/gpu_job.sbatch
# For quick tests use the gpu-debug partition instead of gpu.
#SBATCH -p gpu --gres=gpu:1
#SBATCH -c 8
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH -J dtg
#SBATCH -o logs/%x-%j.out

cd "$SLURM_SUBMIT_DIR"
source setup/env.sh

nvidia-smi
python -c "import torch; print('cuda available:', torch.cuda.is_available())"
# python scripts/encode.py --config configs/default.yaml ...
