node-exporter-start:
	bash scripts/start-node-exporter.sh

snmp-exporter-start:
	bash scripts/start-snmp-exporter.sh

snmp-exporter-start: snmp-exporter-start

copy-ssh-pub:
	bash scripts/copy-ssh-pub.sh
