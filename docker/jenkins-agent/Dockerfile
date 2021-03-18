FROM ubuntu:20.04

RUN apt update; apt install -y gnupg gnupg2 gnupg1 ansible software-properties-common sudo curl tzdata; dpkg-reconfigure -f noninteractive tzdata && \ 
    apt install -y git openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
# Create jenkins user to the image
    groupadd jenkins -g 120 && \ 
    useradd jenkins -u 113 -g 120 -m -d /var/lib/jenkins; echo "jenkins:jenkins" | chpasswd

# Add passwordless authentication
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg > gpg && \
    apt-key add gpg && \
    apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt update -y && apt install -y terraform

# Expose SSH port
EXPOSE 22

# Run sshd
CMD ["/usr/sbin/sshd", "-D"]
