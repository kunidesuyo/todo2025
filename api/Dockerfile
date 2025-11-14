# Goの公式イメージを使用
FROM golang:1.25-alpine

# 必要なパッケージをインストール
RUN apk add --no-cache git

COPY spec/ /app/spec/
COPY api/ /app/api/

WORKDIR /app/api

# ホットリロードするためにairをインストール
RUN go install github.com/air-verse/air@latest

RUN go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest

# 依存関係をダウンロード
RUN go mod download

# ポートを公開
EXPOSE 8080

# アプリケーションを実行
CMD ["air", "-c", ".air.toml"]
