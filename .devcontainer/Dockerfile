##############################################################################
# Base Image : nvcr.io/nvidia/pytorch:21.08-py3 ( Ubuntu 22.04 )
##############################################################################

FROM nvcr.io/nvidia/pytorch:21.08-py3

##############################################################################
# Label
##############################################################################

LABEL org.opencontainers.image.authors="yuzhong1214@gmail.com"
LABEL description="This image is for YOLOv7."

##############################################################################
# Arguments
##############################################################################

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

##############################################################################
# Set environment variables
##############################################################################

ENV USERNAME=${USERNAME}
ENV SHELL=/bin/bash
ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

##############################################################################
# Set shell
##############################################################################

SHELL ["/bin/bash", "-c"]

##############################################################################
# Install required packages
##############################################################################

RUN apt update && apt upgrade -y && apt install -y \
    sudo \
    curl \
    wget \
    vim \
    tmux \
    git \
    htop \
    net-tools \
    gnupg2 \
    tzdata \
    zip \
    screen \
    libgl1-mesa-glx \
    locales \
    && rm -rf /var/lib/apt/lists/*

RUN pip install \
    pandas \
    seaborn \
    thop \
    opencv-python \
    ipykernel \
    ipython \
    pytorchcv \
    torchinfo \
    flexgen \
    wandb

##############################################################################
# Set locale
##############################################################################

RUN locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

##############################################################################
# Set timezone (Taipei)
##############################################################################

RUN TZ=Asia/Taipei && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata 

##############################################################################
# Add new user (Passwordless with sudo)
##############################################################################

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

##############################################################################
# Other commands
##############################################################################

USER ${USERNAME}
COPY .bashrc /home/${USERNAME}/.bashrc 
CMD ["/bin/bash"]
