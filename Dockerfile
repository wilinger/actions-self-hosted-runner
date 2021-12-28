FROM summerwind/actions-runner:v2.286.0-ubuntu-20.04
ARG HVAC_VERSION=0.11.2
USER root 
RUN apt update -y && \
  add-apt-repository --yes --update ppa:ansible/ansible && \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update -y && \
  apt install -y ansible terraform && \
  pip install hvac==${HVAC_VERSION} && \
  rm -rf /var/lib/apt/lists/* /tmp* /var/tmp/*
USER runner

