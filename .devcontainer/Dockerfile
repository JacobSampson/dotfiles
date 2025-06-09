FROM mcr.microsoft.com/devcontainers/base:debian

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 22.16.0
ENV PNPM_HOME $HOME/.pnpm_global

RUN mkdir -p /usr/local/nvm \
    && curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PNPM_HOME:$PATH

# Install pnpm and turbo globally
RUN mkdir -p $PNPM_HOME \
    && npm install -g pnpm@9.14.4 \
    && pnpm add -g turbo

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
