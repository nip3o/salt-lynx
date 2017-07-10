# Manual steps:
# awscli configure

python-pip:
  pkg.installed


awscli:
  pip.installed:
    - name: awscli
    - require:
      - pkg: python-pip


aws-route53-dyndns-dependencies:
  pip.installed:
    - pkgs:
      - requests
      - boto3


run-dyndns-update:
  file.managed:
    - name: /home/niclas/bin/aws-route53-dyndns.py
    - source: salt://route53/config/aws-route53-dyndns.py
    - makedirs: true
    - template: jinja
    - mode: '0755'


  cron.present:
    - name: /home/niclas/bin/aws-route53-dyndns.py
    - user: niclas
    - minute: '*/5'
