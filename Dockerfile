FROM alpine:3.12

# 必要なパッケージのインストール
RUN set -eux \
    && apk update \
    && apk add --no-cache bash curl ca-certificates git \
       unzip autoconf pkgconf automake make cmake gcc g++ tzdata \
    && curl -fsSL https://raw.githubusercontent.com/kurukurumaware/DockerTools/master/extractlibrary \
    -o /usr/local/bin/extractlibrary \
    && chmod +x /usr/local/bin/extractlibrary \
# タイムゾーンを変更する       
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone

ENTRYPOINT ["/bin/sh"]
