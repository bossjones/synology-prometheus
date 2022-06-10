#!/usr/bin/env bash

set -x

_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo docker run \
--restart=always \
--name=snmp_exporter \
--net=host \
--pid=host \
--user 65534:65534 \
--volume ${_DIR}/snmp_exporter/:/etc/snmp_exporter/ \
--volume ${_DIR}/snmp-synology/snmp.yml:/etc/snmp_exporter/snmp.yml:ro \
prom/snmp-exporter:v0.20.0 \
--config.file=/etc/snmp_exporter/snmp.yml \
--log.level=debug
