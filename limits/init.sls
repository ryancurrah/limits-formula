{% from "limits/map.jinja" import pkgs with context %}

pam:
  pkg.installed:
    - name: {{ pkgs.pam }}

/etc/security/limits.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://limits/files/limits.conf
    - require:
      - pkg: pam
