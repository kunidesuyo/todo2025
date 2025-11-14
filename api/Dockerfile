# Goの公式イメージを使用
FROM golang:1.25-alpine

# 必要なパッケージをインストール
RUN apk add --no-cache git

# 作業ディレクトリを設定
WORKDIR /app

# ホットリロードようにairをインストール
RUN go install github.com/air-verse/air@latest

# ソースコードを全てコピー
COPY . .

# 依存関係をダウンロード
RUN go mod download

# ポートを公開
EXPOSE 8080

# アプリケーションを実行
CMD ["air", "-c", ".air.toml"]
