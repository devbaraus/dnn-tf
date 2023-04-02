FROM nvidia/cuda:11.2.0-base-ubuntu18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    screen \
    openssh-server \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

COPY install.sh /

RUN chmod +x /install.sh

CMD ["/bin/bash", "-c", "service ssh start; /bin/bash"] 