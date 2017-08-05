torrent-pkg:
  pkg.installed:
    - names: 
      - deluged
      - deluge-web


deluge:
  user.present:
    - empty_password: True
    - system: True


/etc/systemd/system/deluged.service:
  file.managed:
    - source: salt://torrent/conf/deluged.service
    - mode: 600
    - require:
      - pkg: deluged


/etc/systemd/system/deluge-web.service:
  file.managed:
    - source: salt://torrent/conf/deluge-web.service
    - mode: 600
    - require:
      - pkg: deluge-web


deluged-service:
  service.running:
    - name: deluged
    - enable: True
    - require:
      - pkg: deluged


deluged-web-service:
  service.running:
    - name: deluge-web
    - enable: True
    - require:
      - pkg: deluge-web
