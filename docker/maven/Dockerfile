FROM ubuntu:20.04
RUN apt update -y; apt install -y git maven tzdata; dpkg-reconfigure -f noninteractive tzdata && \
    apt install -y git openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd 

# Expose SSH port
EXPOSE 22

# Run sshd
CMD ["/usr/sbin/sshd", "-D"]