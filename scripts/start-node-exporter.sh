#!/usr/bin/env bash

_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo docker stop snmp_exporter || true
sudo docker rm snmp_exporter || true

sudo docker run \
--restart=always \
--name=node-exporter \
--net=host \
--pid=host \
--user 65534:65534 \
--volume /proc:/host/proc:ro \
--volume /sys:/host/sys:ro \
--volume /:/host/rootfs:ro \
quay.io/prometheus/node-exporter:v1.3.1 \
--path.rootfs=/host/rootfs \
--path.procfs=/host/proc \
--path.sysfs=/host/sys \
--web.listen-address=0.0.0.0:9100 \
'--collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+|var/lib/rkt/pods/.+|volume1/@docker|.+/#snapshot)($|/)' \
'--collector.filesystem.fs-types-exclude=^(autofs|binfmt_misc|cgroup|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|mqueue|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|sysfs|tmpfs|tracefs)$' \
--collector.mountstats
