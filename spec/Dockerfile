FROM swaggerapi/swagger-ui

USER root

# Node.jsとnpmをインストール
RUN apk add --no-cache nodejs npm

# Redocly CLIとPrettierをグローバルインストール
RUN npm install -g @redocly/cli prettier

USER 101

WORKDIR /
