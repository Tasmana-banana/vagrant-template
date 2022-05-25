FROM codercom/code-server:4.4.0

WORKDIR /tmp

RUN sudo apt-get update -y && \
    sudo apt-get install -y unzip \
    apt-transport-https \
    ca-certificates \
    curl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list && \
    curl -LO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl