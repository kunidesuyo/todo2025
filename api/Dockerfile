# Goの公式イメージを使用
FROM golang:1.23-alpine

# 必要なパッケージをインストール
RUN apk add --no-cache git

# 作業ディレクトリを設定
WORKDIR /app

# ソースコードを全てコピー
COPY . .

# go.modが存在する場合は依存関係をダウンロード
RUN if [ -f go.mod ]; then go mod download; fi

# ポートを公開
EXPOSE 8080

# アプリケーションを実行
CMD ["sh"]
