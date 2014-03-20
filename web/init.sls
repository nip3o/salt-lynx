nginx:
  pkg:
    - installed

  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/*


disable-default-site:
  file.absent:
    - name: /etc/nginx/sites-enabled/default


uwsgi:
  pkg:
    - installed

  service.running:
    - name: uwsgi
    - enable: True
    - require:
      - pkg: uwsgi


include:
  - web.files
  - web.niclasolofsson

