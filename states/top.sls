base:
  '*':
    - utils
    - prometheus.node_exporter

dev:
  '*dev*':
    - java

stg:
  '*stg*':
    - java

prd:
  '*prd*':
    - java
