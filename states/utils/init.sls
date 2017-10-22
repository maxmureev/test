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

copy_test_file:
  file.managed:
    - names:
      - /tmp/ddd:
        - source: salt://utils/files/ddd
    - template: jinja


cat_files:
  cmd.run:
    - name: cat /tmp/ddd
