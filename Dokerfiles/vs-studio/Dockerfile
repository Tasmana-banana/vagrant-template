FROM codercom/code-server:4.4.0

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y docker.io \
                       git \
                       ssh \
                       bash-completion \
                       python3-pip \
                       bash-completion \
                       net-tools \
                       iputils-ping \
                       iproute2 \
                       jq && \
    mkdir /run/sshd

RUN pip3 install --upgrade pip && \
    pip3 install docker-compose \
                 ansible \
                 ansible-lint \
                 awscli

ARG AWS_VERSION="1.22.81"
ARG KUBE_VERSION="v1.21.4"

RUN curl --silent \
         -L "https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl" \
         -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl --silent \
         -L "https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator" \
         -o /usr/local/bin/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator

RUN userdel -r coder && \
    useradd -ms /bin/bash tasmana && \
    echo "tasmana ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers.d/nopasswd > /dev/null && \
    usermod -aG docker tasmana && \
    usermod -aG sudo tasmana

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER tasmana
WORKDIR /home/tasmana
ENV USER=tasmana

HEALTHCHECK --interval=30s --timeout=3s \
CMD curl -f -I http://localhost:8080/login || exit 1

ENTRYPOINT [ "entrypoint.sh" ]