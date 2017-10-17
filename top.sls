base:
  '*':
    - utils
    - prometheus.node_exporter

dev:
  '*dev*':
    - ntp

stg:
  '*stg*':
    - ntp

prd:
  '*prd*':
    - ntp
