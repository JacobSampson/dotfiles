FROM mcr.microsoft.com/devcontainers/base:debian

RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 22.16.0
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Install pnpm and turbo globally
# RUN npm install -g pnpm@9.14.4 && pnpm add -g turbo

# Install Tailscale CLI
# RUN apt-get update && \
#     apt-get install -y gnupg2 curl ca-certificates lsb-release && \
#     curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null && \
#     curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list \
#         | tee /etc/apt/sources.list.d/tailscale.list >/dev/null && \
#     apt-get update && \
#     apt-get install -y tailscale && \
#     apt-get clean

# Set working directory
WORKDIR /workspaces/jacobsampson
