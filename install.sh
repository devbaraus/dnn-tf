#!/bin/bash
conda create -n dnn python=3.10 -y && \

conda init && \
source ~/.bashrc && \

conda activate dnn  && \

conda install -n dnn -c conda-forge cudatoolkit=11.2.2 -y && \
conda install -n dnn -c conda-forge cudnn -y && \
conda install -n dnn -c nvidia cuda-nvcc -y && \

echo "export XLA_FLAGS=--xla_gpu_cuda_data_dir=/root/miniconda3/envs/dnn/" >> ~/.bashrc && \

# Install common packages
pip install tensorflow==2.11.*
pip install matplotlib
pip install numpy
pip install pandas
pip install scikit-learn
pip install scipy
pip install seaborn
pip install tqdm
pip install jupyter