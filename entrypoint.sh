#!/bin/sh

export SS_PASSWORD=${SS_PASSWORD:-"5c301bb8-6c77-41a0-a606-4ba11bbab084"}
echo ${SS_PASSWORD}
export SS_PASSWORD_JSON="$(echo -n "$SS_PASSWORD" | jq -Rc)"

export ENCRYPT=${ENCRYPT:-"chacha20-ietf-poly1305"}
echo ${ENCRYPT}

export DOMAIN=${DOMAIN:-"unknown.domain.null"}
echo ${DOMAIN}

export PORT=${PORT:-"32333"}
echo ${PORT}

plugin=$(echo -n "v2ray;path=/${V2_PATH};host=${DOMAIN};tls" | sed -e 's/\//%2F/g' -e 's/=/%3D/g' -e 's/;/%3B/g')
ss="ss://$(echo -n ${ENCRYPT}:${SS_PASSWORD} | base64 -w 0)@${DOMAIN}:${PORT}"
echo "${ss}"
echo "${ss}" | qrencode -t ansiutf8

sh /conf/shadowsocks.conf.template >  /etc/shadowsocks/config.json
echo /etc/shadowsocks/config.json
cat /etc/shadowsocks/config.json

echo "SS SERVER RUN"
/ssbin/ssserver -c /etc/shadowsocks/config.json &
