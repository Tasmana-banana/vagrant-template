FROM codercom/code-server:4.4.0

WORKDIR /tmp

RUN apt install -y unzip \
    apt-transport-https \
    ca-certificates \
    curl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    sudo ./aws/install && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update -y && \
    apt-get install -y kubectl