FROM eclipse-temurin:19-jdk
# Install Node.js & pnpm
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt update && apt-get -y install python3 build-essential nodejs && curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm@7 && pnpm config set store-dir .pnpm-store
# Docker Installation
RUN apt-get -y install ca-certificates gnupg lsb-release && mkdir -m 0755 -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && apt-get update && chmod a+r /etc/apt/keyrings/docker.gpg && apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Install AWS CLI
RUN apt-get -y install unzip && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -rf awscliv2.zip aws