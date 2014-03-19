/etc/netatalk/AppleVolumes.default:
  file.managed:
    - source: salt://fileshare/conf/AppleVolumes.default
    - template: jinja
    - require:
      - pkg: fileshare-pkg

/etc/samba/smb.conf:
  file.managed:
    - source: salt://fileshare/conf/smb.conf
    - template: jinja
    - require:
      - pkg: fileshare-pkg

fileshare-pkg:
  pkg.installed:
    - name: samba
    - name: netatalk
    - name: avahi-daemon
    - name: nfs-kernel-server

samba-service:
  service.running:
    - name: smbd
    - enable: True
    - require:
      - pkg: fileshare-pkg

