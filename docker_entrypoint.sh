#!/bin/bash
set -e

echo "Checking for CUDA at runtime..."
conda run -n neucon python -c "import torch; print('CUDA available:', torch.cuda.is_available())"

echo "Installing TorchSparse..."
FORCE_CUDA=1 conda run -n neucon pip install --force-reinstall \
  git+https://github.com/mit-han-lab/torchsparse.git@48cc7e23784d35e67163f61b9312df138853025e

echo "Starting Neucon..."
exec conda run -n neucon python /app/scripts/neucon_main.py --cfg /app/configs/neucon.yaml
