{%- from "gogs/map.jinja" import gogs with context -%}

include:
  - gogs

gogs_data_dir:
  file.directory:
    - name: {{ gogs.data_dir }}
    - user: {{ gogs.user }}
    - group: {{ gogs.user }}
    - makedirs: True
    - require:
      - user: gogs-user

gogs_logs_dir:
  file.directory:
    - name: {{ gogs.logs_dir }}
    - user: {{ gogs.user }}
    - group: {{ gogs.user }}
    - makedirs: True
    - require:
      - user: gogs-user

gogs_repositories_dir:
  file.directory:
    - name: {{ gogs.repo_root_dir }}
    - user: {{ gogs.user }}
    - group: {{ gogs.user }}
    - makedirs: True
    - require:
      - user: gogs-user
