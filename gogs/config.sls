{%- from "gogs/map.jinja" import gogs with context -%}

include:
  - gogs.install

gogs-conf-dir:
  file.directory:
    - name: {{ gogs.conf_dir }}
    - mode: 755

gogs_conf_file:
  file.managed:
    - name: {{ gogs.conf_file }}
    - source: salt://gogs/files/app.ini.jinja
    - template: jinja
    - require:
      - file: gogs-conf-dir
    - watch_in:
      - module: gogs-restart
