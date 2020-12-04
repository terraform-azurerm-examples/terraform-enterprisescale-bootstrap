FROM ubuntu:focal

# Set versions for all downloaded tools
ARG TERRAFORM_VERSION=0.14.0
ARG TFLINT_VERSION=0.21.0
ARG TFLINT_AZURE_VERSION=0.6.0

# To build without user input
ENV DEBIAN_FRONTEND=noninteractive

# Update & Install common tools and packages
RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    jq \
    curl \
    git \
    unzip

# Install Azure CLI & extensions
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && az extension add --system --name azure-devops \
    && az extension add --system --name account \
    && az extension add --system --name alias

# Install Terraform latest
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update && apt-get install terraform=${TERRAFORM_VERSION}

# Make shared download folder
RUN mkdir -p /tmp/docker-downloads

# Install tflint
ENV TFLINT_PLUGIN_DIR=/.tflint.d/plugins
RUN curl -sSL https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip -o /tmp/docker-downloads/tflint.zip \
    && unzip /tmp/docker-downloads/tflint.zip \
    && mv tflint /usr/local/bin \
    && curl -sSL https://github.com/terraform-linters/tflint-ruleset-azurerm/releases/download/v${TFLINT_AZURE_VERSION}/tflint-ruleset-azurerm_linux_amd64.zip -o /tmp/docker-downloads/tflint-ruleset-azurerm.zip \
    && unzip /tmp/docker-downloads/tflint-ruleset-azurerm.zip \
    && mkdir -p ${TFLINT_PLUGIN_DIR} \
    && mv tflint-ruleset-azurerm ${TFLINT_PLUGIN_DIR}/tflint-ruleset-azurerm

# Remove shared download folder
RUN rm -rf /tmp/docker-downloads

# change /bin/sh symlink from dash (default in ubuntu:focal) to bash
RUN rm -f /bin/sh && ln -s bash /bin/sh

# Set the path and other runtime env vars
ENV DEBIAN_FRONTEND=interactive
