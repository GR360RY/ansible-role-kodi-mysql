kodi-mysql
===========

[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.kodi--mysql-green.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/3098)

An ansible role to setup and configure Kodi Mysql Database under Debian based distro's. This role creates empty Music and Videos Databases with preconfigured media paths.

Requirements
------------

This role requires Ansible 1.6 or higher. Platform requirements are listed in the metadata file.

Overview
--------

Role Variables
--------------

```yaml
kodi_mysqldb_host: "{{ ansible_default_ipv4.address }}"
kodi_mysqldb_user: kodi
kodi_mysqldb_password: kodi


media_path:                 # Location of xbmc media folders.

movies_folder:
tv_folder:
music_folder:
```

Dependencies
------------

This role is a part of `htpc-ansible` playbook that includes additional set of components required for HTPC automation.

The following list of roles can be used together with kodi-mysql role:

     - kodi-client
     - htpc-nas
     - sickbeard
     - couchpotato
     - subnzbd
     - deluge
     - htpc-manager
     - tvheadend

Detailed info can be found following this link:

https://github.com/GR360RY/htpc-ansible


Example Playbook
-------------------------

```
- hosts: htpc-server

  vars:
    kodi_mysqldb_user: xbmc
    kodi_mysqldb_password: xbmc
    media_path: /mnt/xbmc

    movies_folder: movies
    tv_folder: tv
    music_folder: music

  roles:
    - role: kodi-mysql
```

HTPC-Ansible Project
--------------------

This role is part of HTPC-Ansible project that includes additional roles for building Ubuntu Based HTPC Server.

 Role name               | Comment
-------------------------|-----------------------------
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--user-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645) |  Create htpc user on Linux
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--media-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)      | Create htpc media folders
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--nas-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Configure NAS ( NFS, CIFS and AFP )
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.kodi--client-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/3098)    | Install Kodi Media Player
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.kodi--mysql-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install MySQL Backend for Kodi
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.deluge-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install Deluged Bittornet Client
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.sabnzbd-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install Sabnzbd
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.nzbtomedia-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install NZBtoMedia Postprocessing
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.sickbeard-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install SickRage
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.couchpotato-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install CouchPotato
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--manager-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install htpc-manager
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.tvheadend-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645)    | Install Tvheadend


Additional Info is available at [www.htpc-ansible.org](http://www.htpc-ansible.org)

License
-------

BSD

Author Information
------------------

Gregory Shulov