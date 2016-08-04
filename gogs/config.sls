{%- from "gogs/map.jinja" import gogs with context -%}

#include:
#  - gogs

gogs-conf-dir:
  file.directory:
    - name: {{ gogs.conf_dir }}

gogs_conf_file:
  file.managed:
    - name: {{ gogs.conf_file }}
    - source: salt://gogs/files/app.ini.jinja
    - template: jinja
    - require:
      - file: gogs-conf-dir
#    - watch_in:
#      - module: gogs-restart
