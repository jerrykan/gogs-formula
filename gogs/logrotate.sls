gogs-logrotate-conf:
  file.managed:
    - name: /etc/logrotate.d/gogs
    - source: salt://gogs/files/logrotate.jinja
    - template: jinja
