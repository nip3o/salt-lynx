torrent-pkg:
  pkg.installed:
    - name: deluged

torrent-service:
  service.running:
    - name: deluged
    - enable: True
    - require:
      - pkg: deluged
#    - watch:

#/etc/dnsmasq.conf:
#  file.managed:
#    - source: salt://dnsmasq/conf/dnsmasq.conf
#    - template: jinja
#    - mode: 600
#    - require:
#      - pkg: dnsmasq

