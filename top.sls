base:
  '*':
    - utils
    - prometheus.node_exporter
  salt:
    - utils
    - prometheus.node_exporter
    
dev:
  '*dev*':
    - ntp
  salt:
    - ntp
    
stg:
  '*stg*':
    - ntp
  salt:
    - ntp
    
prd:
  '*prd*':
    - ntp
  salt:
    - ntp
