{% set vars = pillar.node_exporter %}

node_exporter:
  user.present:
    - createhome: False
    - shell: /bin/zsh
    - system: True

get_node_exporter:
  cmd.run:
    - unless: wget https://github.com/prometheus/node_exporter/releases/download/v{{ vars.version }}/node_exporter-{{ vars.version }}.linux-amd64.tar.gz -O /tmp/node_exporter-{{ vars.version }}.linux-amd64.tar.gz
  archive.extracted:
    - name: /tmp/
    - source: /tmp/node_exporter-{{ vars.version }}.linux-amd64.tar.gz
    - archive_format: tar
    - skip_verify: true
    - overwrite: true
    - enforce_toplevel: false

install_node_exporter:
  cmd.run:
    - name: mv /tmp/node_exporter-{{ vars.version }}.linux-amd64/node_exporter /usr/local/bin/

/etc/systemd/system/node_exporter.service:
  file.managed:
    - source: salt:///prometheus/files/etc/systemd/system/node_exporter.service

/etc/node_exporter:
  file.directory:
    - name: /etc/node_exporter
    - mkdirs: True

/etc/node_exporter/node_exporter.conf:
  file.managed:
    - source: salt:///prometheus/files/etc/node_exporter/node_exporter.conf

node_exporter.service:
  service.running:
    - enable: True
    - reload: True
