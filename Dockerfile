FROM node:18

RUN apt-get update && \
    apt install -y \
    python3 \
    python3-pip \
    pylint \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN npm install -g serverless
RUN pip3 install --break-system-packages pylint
RUN pip3 install --break-system-packages coverage
RUN pip3 install --break-system-packages pytest

RUN echo "# Aliases" >> /etc/bash.bashrc
RUN echo "alias ls='ls --color'" >> /etc/bash.bashrc
RUN echo "alias ll='ls -l'" >> /etc/bash.bashrc

ENV PATH "$PATH:/build/node_modules/.bin"
