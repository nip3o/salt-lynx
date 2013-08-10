/etc/ddclient.conf:
  file.managed:
    - source: salt://dyndns/conf/ddclient.conf
    - template: jinja
    - mode: 600
    - require:
      - pkg: ddclient

ddclient-service:
  service.running:
    - name: ddclient
    - enable: True
    - require:
      - pkg: ddclient
    - watch:
      - file: /etc/ddclient.conf

dyndns-pkg:
  pkg.installed:
    - name: ddclient

