FROM alpine:3.12

# 必要なパッケージのインストール
ADD https://raw.githubusercontent.com/kurukurumaware/extlibcp/master/extlibcp /usr/local/bin
RUN set -eux \
    && apk update \
    && apk add --no-cache bash curl ca-certificates git \
       unzip autoconf pkgconf automake make cmake gcc g++ tzdata \
    && chmod +x /usr/local/bin/extlibcp \
# タイムゾーンを変更する       
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone

ENTRYPOINT ["/bin/sh"]
