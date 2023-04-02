FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    screen \
    nvtop \
    glances \
    openssh-server \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh 
RUN bash miniconda.sh -b 
RUN rm miniconda.sh

ENV PATH="/root/miniconda3/bin:${PATH}"

COPY install.sh /

RUN chmod +x /install.sh

RUN bash -i /install.sh

CMD ["/bin/bash", "-c", "service ssh start; /bin/bash"] 