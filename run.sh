#!/bin/bash
# Run one notebook headless on the server: ./run.sh exp39/exp39_<name>_colab.ipynb
# The executed copy (all outputs) goes to runs/<name>.ipynb and the log to runs/<name>.log; models and results are pushed to HF by the notebook itself.
set -e
cd "$(dirname "$0")"
source ~/env/bin/activate
mkdir -p runs
nb="$1"; name=$(basename "$nb" .ipynb)
cd "$(dirname "$nb")"
papermill "$(basename "$nb")" "../runs/$name.ipynb" --log-output 2>&1 | tee "../runs/$name.log"
