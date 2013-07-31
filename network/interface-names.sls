/etc/udev/rules.d/70-persistent-net.rules:
  file.managed:
    - mode: 600
    - source: salt://network/conf/70-persistent-net.rules
    - template: jinja

