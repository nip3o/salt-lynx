/etc/nginx/sites-available/files.niclasolofsson.se:
  file.managed:
    - source: salt://web/conf/files.niclasolofsson.se
    - template: jinja
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/files.niclasolofsson.se:
  file.symlink:
    - target: /etc/nginx/sites-available/files.niclasolofsson.se
    - require:
      - pkg: nginx

