FROM archlinux:latest AS base

WORKDIR /usr/local/bin
ENV DOCKER_CONTAINER=true

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y software-properties-common curl git build-essential && \
#     apt-add-repository -y ppa:ansible/ansible && \
#     apt-get update && \
#     apt-get install -y curl git ansible build-essential && \
#     apt-get install -y sudo && \
#     apt-get clean autoclean && \
#     apt-get autoremove --yes

RUN pacman -Syu \
    sudo which git ansible fzf \
    python-requests openssh base-devel \
    --noconfirm
RUN pacman -Syu \
    go rust composer jdk-openjdk luarocks ruby \
    --noconfirm
RUN pacman -Syu \
    python-pip julia \
    --noconfirm


FROM base AS coldb
ARG TAGS
RUN useradd -m coldb
RUN echo "coldb ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/coldb-nopasswd && \
    chmod 0440 /etc/sudoers.d/coldb-nopasswd
USER coldb
WORKDIR /home/coldb

FROM coldb
COPY --chown=coldb:coldb . ./ansible 
COPY --chown=coldb:coldb ./execute-ansible .

RUN ansible-galaxy collection install -r ./ansible/collections/requirements.yaml

# COPY ansible-run-arch ./run-arch

CMD ["sh", "-c", "anible-playbook $TAGS local.yml"]
