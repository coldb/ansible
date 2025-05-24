FROM ubuntu:noble AS base
# Remove the default ubuntu user with uid 1000 - https://askubuntu.com/a/1515958
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKER_CONTAINER=true
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get install -y sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS coldb
ARG TAGS
RUN addgroup --gid 1000 coldb
RUN adduser --gecos coldb --uid 1000 --gid 1000 --disabled-password coldb
RUN usermod -aG sudo coldb
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER coldb
WORKDIR /home/coldb

FROM coldb
COPY --chown=coldb:coldb . ./ansible 
# COPY ansible-run ./ansible-run
CMD ["sh", "-c", "anible-playbook $TAGS local.yml"]
