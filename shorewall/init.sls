/etc/default/shorewall:
  file.managed:
    - source: salt://shorewall/conf/startup
    - require:
      - pkg: shorewall

/etc/default/shorewall-init:
  file.managed:
    - source: salt://shorewall/conf/shorewall-init
    - require:
      - pkg: shorewall

/etc/shorewall/interfaces:
  file.managed:
    - source: salt://shorewall/conf/interfaces
    - require:
      - pkg: shorewall

/etc/shorewall/masq:
  file.managed:
    - source: salt://shorewall/conf/masq
    - require:
      - pkg: shorewall

/etc/shorewall/policy:
  file.managed:
    - source: salt://shorewall/conf/policy
    - require:
      - pkg: shorewall

/etc/shorewall/rules:
  file.managed:
    - source: salt://shorewall/conf/rules
    - template: jinja
    - require:
      - pkg: shorewall

/etc/shorewall/zones:
  file.managed:
    - source: salt://shorewall/conf/zones
    - require:
      - pkg: shorewall

/etc/shorewall/shorewall.conf:
  file.sed:
    - before: 'Keep'
    - after: 'On'
    - limit: 'IP_FORWARDING='

shorewall-service:
  service.running:
    - name: shorewall
    - enable: False
    - require:
      - pkg: shorewall
    - watch:
      - file: /etc/shorewall/interfaces
      - file: /etc/shorewall/masq
      - file: /etc/shorewall/policy
      - file: /etc/shorewall/rules
      - file: /etc/shorewall/zones
      - file: /etc/default/shorewall

shorewall-pkg:
  pkg.installed:
    - names:
      - shorewall
      - shorewall-init

