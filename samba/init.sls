/etc/samba/smb.conf:
  file.managed:
    - source: salt://samba/conf/smb.conf
    - require:
      - pkg: samba

samba-pkg:
  pkg.installed:
    - name: samba

samba-service:
  service.running:
    - name: smbd
    - enable: True
    - require:
      - pkg: samba

