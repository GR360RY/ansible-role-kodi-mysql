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

 name                       | default                              
----------------------------|----------
 kodi_mysqldb_user          | kodi
 kodi_mysqldb_password      | kodi


Dependencies
------------

 Role Name| Description
----------|-----------
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--user-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4645) | Create htpc user on Linux.
[![Galaxy](http://img.shields.io/badge/galaxy-GR360RY.htpc--media-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/4926)| Create HTPC Media Folders.

Variables defined in `GR360RY.htpc-user` role:

 GR360RY.htpc-user        | Default       | Comment          
--------------------------|---------------|---------
 htpc_user_username       | htpc          | Username
 htpc_user_password       | htpc          | Password
 htpc_user_shell          | /bin/bash     | Shell
 htpc_user_ssh_service    | yes           | Install sshd service
 htpc_user_sudo_access    | yes           | Sudo Access

Variables defined in `GR360RY.htpc-media` role:

 GR360RY.htpc-media       | Default       | Comment          
--------------------------|---------------|---------
 htpc_media_path          | /mnt/media    |
 htpc_media_movies        | movies        |
 htpc_media_tv            | tv            |
 htpc_media_music         | music         |
 htpc_media_pictures      | pictures      |


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