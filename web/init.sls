nginx:
  pkg:
    - installed

  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx

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

