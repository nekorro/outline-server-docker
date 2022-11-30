FROM nginx:stable-alpine

ARG SSRUST_VERSION=v1.14.3

RUN apk --no-cache add jq libqrencode
RUN mkdir -p /etc/shadowsocks /ssbin /wwwroot
RUN wget -O- https://github.com/shadowsocks/shadowsocks-rust/releases/download/${SSRUST_VERSION}/shadowsocks-${SSRUST_VERSION}.x86_64-unknown-linux-musl.tar.xz | tar Jx -C /ssbin
