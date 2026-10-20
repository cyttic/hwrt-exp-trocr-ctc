# hwrt-exp-trocr-ctc

Notebooks for the TrOCR-base ViT + CTC experiments (exp39), exchanged between the local machine and the A5000 server. Results (models, metrics) go to Hugging Face, not to this repo.

## Server setup (once)

```bash
source ~/env/bin/activate
pip install papermill ipykernel
hf auth login
git clone https://github.com/cyttic/hwrt-exp-trocr-ctc.git
```

(HTTPS needs no key on the server if the repo is public; with an SSH key added to GitHub, `git clone git@github.com:cyttic/hwrt-exp-trocr-ctc.git` works too.)

## Run a notebook

```bash
cd ~/hwrt-exp-trocr-ctc && git pull
tmux new -s train
./run.sh exp39/exp39_<name>_colab.ipynb
```

Detach: Ctrl+B, then D. Re-attach: `tmux attach -t train`. Output: `runs/<name>.ipynb` and `runs/<name>.log`.
