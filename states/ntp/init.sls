ntp:
  pkg.installed:
    - name: ntp

ntp_conf:
  file.managed:
    - name: /etc/ntp.conf
    - template: jinja
    - source: salt://ntp/files/etc/ntp.conf
    - require:
      - pkg: ntp

ntp_running:
  service.running:
    - name: ntp
    - enable: True
    - watch:
      - file: /etc/ntp.conf
