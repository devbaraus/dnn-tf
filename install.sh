#!/bin/bash
USER=${USER:-"dnn"}
PASS=${PASS:-"dnn"}

# if not user was created, create one
useradd -m -s /bin/bash -p $(openssl passwd -1 $PASS) $USER
usermod -aG sudo $USER
chown -R $USER:$USER /opt/conda

echo $PASS | su - $USER << EOF
conda update -n base -c defaults conda -y && \
conda create -n dnn python=3.10 -y && \

conda init && \
source ~/.bashrc && \

conda activate dnn  && \

conda install -n dnn -c conda-forge cudatoolkit=11.2.2 -y && \
conda install -n dnn -c conda-forge cudnn -y && \
conda install -n dnn -c nvidia cuda-nvcc -y && \

echo "export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/conda/envs/dnn/" >> ~/.bashrc && \

# Install common packages
pip install tensorflow==2.11.* && \
pip install matplotlib && \
pip install numpy && \
pip install pandas && \
pip install scikit-learn && \
pip install scipy && \
pip install seaborn && \
pip install tqdm && \
pip install jupyter

EOF