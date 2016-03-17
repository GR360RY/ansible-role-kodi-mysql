kodi-mysql
===========

[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.kodi--mysql-green.svg?style=flat-square)](https://galaxy.ansible.com/GR360RY/kodi-mysql)

An ansible role to setup and configure Kodi Mysql Database. This role creates empty Music and Videos Databases with preconfigured media paths.

Requirements
------------

This role requires Ansible 2.0 or higher. Platform requirements are listed in the metadata file.

Overview
--------

List of tasks that will be performed under kodi-mysql role:

* Install MySQL Server
* Configure MySQL Server to Listen on All Interfaces
* Create MySQL User for Kodi Music and Videos Databases with preconfigured media paths
* If Music and Videos Databases are already in place, skip database import

Role Variables
--------------

```
---
# defaults file for kodi-mysql
kodi_mysql_enabled: yes

# Helper Variable.
kodi_mysqldb_host: "{{ ansible_default_ipv4.address }}"

kodi_mysqldb_user: kodi
kodi_mysqldb_password: kodi
```


Dependencies
------------

* `GR360RY.htpc-common` role. Creates htpc user and media folders

```
# defaults file for htpc-common

htpc_user_username: htpc
htpc_user_password: htpc
htpc_user_group: htpc
htpc_user_shell: /bin/bash
htpc_user_sudo_access: yes
htpc_ssh_service: yes
htpc_create_media_folders: yes
htpc_zeroconf: yes
htpc_media_path: /mnt/media
htpc_media_movies: movies
htpc_media_tv: tv
htpc_media_music: music
htpc_media_pictures: pictures
htpc_downloads_complete: "{{ htpc_media_path }}/downloads/complete"
htpc_downloads_incomplete: "{{ htpc_media_path }}/downloads/incomplete"
```

Example Playbook
-------------------------

Configure Kodi Mysql Database:

```
    - hosts: htpc

      vars:

        kodi_mysqldb_user: foo
        kodi_mysqldb_password: bar

      roles:
        - role: GR360RY.kodi-mysql
```

Configure Kodi together with Kodi Mysql Database ( download GR360RY.kodi-client role ):

```
    - hosts: htpc

      roles:
        - role: GR360RY.kodi-client
        - role: GR360RY.kodi-mysql
```


HHTPC-Ansible Project
--------------------

This role is part of HTPC-Ansible project that includes additional roles for building Ubuntu Based HTPC Server.

Complete list of Ansible Galaxy roles is below:

- [`GR360RY.htpc-common`](https://galaxy.ansible.com/GR360RY/htpc-common) - Create htpc user and media folders
- [`GR360RY.htpc-nas`](https://galaxy.ansible.com/GR360RY/htpc-nas) - Configure NAS ( NFS, CIFS and AFP )
- [`GR360RY.kodi-client`](https://galaxy.ansible.com/GR360RY/kodi-client) - Install Kodi Media Player
- [`GR360RY.kodi-mysql`](https://galaxy.ansible.com/GR360RY/kodi-mysql) - Install MySQL Backend for Kodi
- [`GR360RY.deluge`](https://galaxy.ansible.com/GR360RY/deluge) - Install Deluge Bittornet Client
- [`GR360RY.sabnzbd`](https://galaxy.ansible.com/GR360RY/sabnzbd) - Install Sabnzbd Usenet Client
- [`GR360RY.nzbtomedia`](https://galaxy.ansible.com/GR360RY/nzbtomedia) - Install NZBtoMedia Postprocessing
- [`GR360RY.sickrage`](https://galaxy.ansible.com/GR360RY/sickrage) - Install SickRage
- [`GR360RY.couchpotato`](https://galaxy.ansible.com/GR360RY/couchpotato) - Install CouchPotato
- [`GR360RY.htpc-manager`](https://galaxy.ansible.com/GR360RY/htpc-manager) - Install HTPCManager

Additional Info is available at [www.htpc-ansible.org](http://www.htpc-ansible.org)

License
-------

BSD

Author Information
------------------

Gregory Shulov