niclas:
  user.present:
    - shell: /bin/zsh
    - groups:
      - sudo

autojump:
  pkg.installed

sshkeys:
  ssh_auth.present:
    - user: niclas
    - enc: ssh-rsa
    - source: salt://niclas/conf/niclas_loris.pub

/home/niclas/.zshrc:
  file.managed:
    - source: salt://niclas/conf/.zshrc
    - user: niclas
    - group: niclas

/home/niclas/.zsh:
  file.recurse:
    - source: salt://niclas/conf/.zsh/
    - user: niclas
    - group: niclas

/home/niclas/.gitconfig:
  file.managed:
    - source: salt://niclas/conf/.gitconfig
    - user: niclas
    - group: niclas

