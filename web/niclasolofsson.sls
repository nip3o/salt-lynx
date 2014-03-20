
/etc/nginx/sites-available/niclasolofsson.se:
  file.managed:
    - source: salt://web/conf/niclasolofsson.se
    - require:
      - pkg: nginx

/etc/nginx/sites-enabled/niclasolofsson.se:
  file.symlink:
    - target: /etc/nginx/sites-available/niclasolofsson.se

