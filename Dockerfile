FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    wget \
    curl \
    ca-certificates \
    cmake \
    && rm -rf /var/lib/apt/lists/*

ADD https://api.github.com/repos/shioko-chan/LIBERO/git/refs/heads/master version.json

RUN cd / && git clone https://github.com/shioko-chan/LIBERO.git

WORKDIR /LIBERO

RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && . $HOME/.local/bin/env \
    && uv sync --frozen

ENTRYPOINT ["/bin/bash"]