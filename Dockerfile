FROM alpine:3.12 AS alpine-build-env

ENV LD_LIBRARY_PATH=/usr/local/lib64

# 必要なパッケージのインストール
RUN set -eux \
    && apk --update add --no-cache curl ca-certificates bash git \
       unzip autoconf pkgconf automake make cmake gcc g++ tzdata \
# タイムゾーンを変更する       
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
