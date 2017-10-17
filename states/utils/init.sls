utils:
  pkg:
    - installed
    - pkgs:
      - mc
      - htop
      - iotop
      - iftop
      - screen
      - tmux
      - unzip
      - wget
      - curl
      - ntpdate
      - snoopy

snoopy_enable:
  file.managed:
    - names:
      - /etc/ld.so.preload:
        - source: salt://utils/files/etc/ld.so.preload
