FROM ubuntu:latest
MAINTAINER lucyoa

RUN dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt-get install -y \
    libc6:i386 \
    libc6-dbg:i386 \
    libc6-dbg \
    lib32stdc++6 \
    g++-multilib \
    git \
    gdb \
    net-tools \
    libffi-dev \
    libssl-dev \
    python \
    python-pip \
    python-capstone \
    ruby2.3 \
    strace \
    sudo \
    ltrace \
    nasm \
    vim \
    nano \
    wget  --fix-missing && \
    rm -rf /var/lib/apt/list/*

RUN mkdir -p /ctf/tools && mkdir -p /ctf/work

RUN git clone https://github.com/longld/peda /ctf/tools/peda && \
    git clone https://github.com/scwuaptx/Pwngdb /ctf/tools/pwngdb && \
    echo "source /ctf/tools/peda/peda.py" >> ~/.gdbinit

RUN pip install --upgrade pip && \
    pip install \
        ropgadget \
        pwntools && \
        rm -rf ~/.cache/pip/*

WORKDIR /ctf/work/

ENTRYPOINT ["/bin/bash"]
