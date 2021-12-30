FROM summerwind/actions-runner:latest
ARG HVAC_VERSION=0.11.2
ARG ARGOCD_VERSION=v2.2.1
USER root 
RUN apt update -y && \
  add-apt-repository --yes --update ppa:ansible/ansible && \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update -y && \
  apt install -y ansible terraform && \
  curl -fsSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/${ARGOCD_VERSION}/argocd-linux-amd64 && \
  chmod +x /usr/local/bin/argocd && \
  python3 -m pip install hvac==${HVAC_VERSION} && \
  rm -rf /var/lib/apt/lists/*
USER runner

