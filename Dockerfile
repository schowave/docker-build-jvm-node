FROM eclipse-temurin:19-jdk
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt update && apt-get -y install python3 build-essential nodejs && curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm@7 && pnpm config set store-dir .pnpm-store

