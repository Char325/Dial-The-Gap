#!/bin/bash
#SBATCH -p batch
#SBATCH -c 4
#SBATCH --mem=8G
#SBATCH --time=12:00:00
#SBATCH -J dtg-download
#SBATCH -o logs/%x-%j.out
cd "$SLURM_SUBMIT_DIR"; source setup/env.sh


cd $DTG_RAW/coco
wget -c -nv http://images.cocodataset.org/zips/train2017.zip && unzip -oq train2017.zip && rm train2017.zip
echo "COCO train images: $(ls train2017 | wc -l) (expect 118287)"

hf download OpenSound/AudioCaps --repo-type dataset \
  --include "data/train-*" --local-dir $DTG_RAW/audiocaps
echo "AudioCaps train shards: $(ls $DTG_RAW/audiocaps/data/train-* | wc -l) (expect 412)"