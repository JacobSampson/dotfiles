FROM mcr.microsoft.com/devcontainers/base:debian

RUN export NVM_DIR=/home/node/.nvm && \
    mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    $NVM_DIR/nvm.sh && \
    nvm install 20 && \
    nvm use 20 && \
    nvm alias default 20

ENV PATH="/home/node/.nvm/versions/node/v20.*/bin/:$PATH"

# Install pnpm and turbo globally
RUN npm install -g pnpm@9.14.4 && pnpm add -g turbo

# Install Tailscale CLI
RUN apt-get update && \
    apt-get install -y gnupg2 curl ca-certificates lsb-release && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list \
        | tee /etc/apt/sources.list.d/tailscale.list >/dev/null && \
    apt-get update && \
    apt-get install -y tailscale && \
    apt-get clean

# Set working directory
WORKDIR /workspaces/jacobsampson
