/etc/default/shorewall:
  file.managed:
    - source: salt://network/conf/shorewall-startup
    - require:
      - pkg: shorewall

/etc/shorewall:
  file.recurse:
    - source: salt://network/conf/shorewall/
    - require:
      - pkg: shorewall

/etc/shorewall/shorewall.conf:
  file.sed:
    - before: 'Keep'
    - after: 'On'
    - limit: 'IP_FORWARDING='

service shorewall restart:
  cmd.wait:
    - watch:
      - file: /etc/shorewall/policy

