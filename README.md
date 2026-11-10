# Dial-The-Gap
Text as a bridge between modalities: the modality gap as a controlled variable in bridged image–audio alignment (CSCI 2951X, Brown).

## Layout

```
configs/default.yaml        encoder pairs, manifest paths, head/eval/sweep settings
setup/env.sh                source in every shell and Slurm job (paths, caches, venv)
setup/install.sh            one-time venv creation + pip install
requirements.txt
src/dtg/                    library code
  config.py  encoders.py  heads.py  geometry.py  retrieval.py  predict.py
scripts/
  data/                     build CSV manifests, leakage check
  encode.py                 frozen encoders -> features (run once, GPU)
  train_heads.py            bridge heads (image->text, audio->text)
  e1_baseline.py … e6_bound.py
slurm/gpu_job.sbatch        template GPU job
notebooks/                  analysis and figures
```

Data, features, model caches and results live under `$DTG_DATA`, not in the repo.

## Setup on Oscar

```bash
git clone https://github.com/Char325/Dial-The-Gap.git
cd Dial-The-Gap
git checkout setup-structure

# Edit DTG_DATA in setup/env.sh to a large directory (home quota is 20GB).
# If python3 -V is older than 3.10, first run: module avail python  and load a newer one.
bash setup/install.sh        # creates the venv at $DTG_DATA/venv and installs requirements
source setup/env.sh          # every new shell / job
```

Check the GPU build on a GPU node: `mkdir -p logs && sbatch slurm/gpu_job.sbatch` (or switch it to `-p gpu-debug` for a quick check).
