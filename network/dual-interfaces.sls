/etc/network/interfaces:
  file.managed:
    - source: salt://network/conf/interfaces
    - template: jinja

service networking restart:
  cmd.wait:
    - watch:
      - file: /etc/network/interfaces

