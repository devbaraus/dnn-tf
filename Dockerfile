FROM tensorflow/tensorflow:2.11.0-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    screen \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN pip install matplotlib && \
    pip install numpy && \
    pip install pandas && \
    pip install scikit-learn && \
    pip install scipy && \
    pip install seaborn && \
    pip install tqdm && \
    pip install jupyter

CMD ["/bin/bash", "-c", "service ssh start; /bin/bash"] 