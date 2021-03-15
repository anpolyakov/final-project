FROM ubuntu:20.04

RUN apt update; apt install -y sudo tzdata; dpkg-reconfigure -f noninteractive tzdata && \ 
    apt install -y git openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
# Create jenkins user to the image
    groupadd jenkins -g 120 && \ 
    useradd jenkins -u 113 -g 120 -m -d /var/lib/jenkins; echo "jenkins:jenkins" | chpasswd

# Add passwordless authentication
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Expose SSH port
EXPOSE 22

# Run sshd
CMD ["/usr/sbin/sshd", "-D"]