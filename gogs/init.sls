{%- from "gogs/map.jinja" import gogs with context -%}

gogs-package-deps:
  pkg.installed:
    - name: git

gogs-binary-dir:
  file.directory:
    - name: {{ gogs.install_dir }}

gogs-binary-package:
  archive.extracted:
    - name: {{ gogs.install_dir }}
    - source: {{ gogs.binary_archive }}
{%- if gogs.binary_archive_hash %}
    - source_hash: {{ gogs.binary_archive_hash }}
{%- endif %}
    - archive_format: tar
    - if_missing: {{ gogs.install_dir }}/gogs
{%- if salt['grains.get']('saltversion') < (2014, 7, 1) %}
    # leading space and trailing dash are required for salt <2014.7.1
    - tar_options: ' --strip-components=1 -'
{%- else %}
    - tar_options: '--strip-components=1'
{%- endif %}
    - require:
      - file: gogs-binary-dir

gogs-user:
  user.present:
    - name: {{ gogs.user }}
    - home: {{ gogs.home_dir }}
    - createhome: False
    - shell: /bin/bash
    - system: True

{# TODO: conditional based on init system?? -#}
gogs-systemd-file:
  file.managed:
    - name: /etc/systemd/system/gogs.service
    - source: salt://gogs/files/gogs.service.jinja
    - template: jinja

gogs-service:
  service.running:
    - name: gogs
    - enable: True
    - require:
      - file: gogs-systemd-file
      - user: gogs-user

gogs-restart:
  module.wait:
    - name: service.restart
    - m_name: gogs
    - require:
      - service: gogs-service
