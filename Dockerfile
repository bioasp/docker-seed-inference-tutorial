FROM ubuntu:questing

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV PATH=/home/user/.local/bin:/opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        git \
        ca-certificates \
        curl\
        && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN CONDA_VERSION="py311_25.11.1-1" && \
    echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    curl -fLs https://repo.continuum.io/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh --output ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    find /opt/conda -name '*.a' -delete &&\
    conda clean -y --all && rm -rf /opt/conda/pkgs

RUN pip install seed2lp
RUN pip install  git+https://github.com/cfrioux/NetSeedPy.git@main

USER ubuntu
COPY --chown=ubuntu seed_inference_tutorial /wd
COPY --chown=ubuntu run_*.sh /wd
WORKDIR /wd
