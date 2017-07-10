fileshare-pkg:
  pkg.installed:
    - pkgs:
      - samba
      - netatalk
      - avahi-daemon
      - nfs-kernel-server

  service.running:
    - name: smbd
    - enable: True
    - require:
      - pkg: fileshare-pkg

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
