# Adding the release channel using Salt states turned out to be horribly more painful than expected.

# Manual steps:
# > sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/emby/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/emby-server.list"
# > wget http://download.opensuse.org/repositories/home:emby/xUbuntu_16.04/Release.key
# > sudo apt-key add - < Release.key


emby-server:
  pkg.installed:
    - name: emby-server

  service.running:
    - name: emby-server
    - enable: True
    - require:
      - pkg: emby-server
