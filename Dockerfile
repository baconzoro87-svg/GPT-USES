FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && \
    apt-get install -y wget curl git openssh-client python3 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install tmate (working .tar.gz version)
RUN wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.gz && \
    tar -xzf tmate-2.4.0-static-linux-amd64.tar.gz && \
    mv tmate-2.4.0-static-linux-amd64/tmate /usr/local/bin/tmate && \
    chmod +x /usr/local/bin/tmate && \
    rm -rf tmate-2.4.0-static-linux-amd64*

# App directory
RUN mkdir -p /app && echo "Tmate Session Running..." > /app/index.html
WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]
