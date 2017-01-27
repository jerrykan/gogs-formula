====
Gogs
====

Formula to set up and configure the Gogs self-hosted Git service.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Notes
=====

Gogs currently has no good way to automate the creation of the initial admin
user. As a work-around until a solution can be found the following manual steps
can be performed:

#) Set the gogs config directory to be world writable so that the installer can
   write to it::

    chmod 777 /etc/gogs

#) Edit the ``/etc/gogs/app.ini`` file to enable the installer::

    30c30
    < INSTALL_LOCK = true
    ---
    > INSTALL_LOCK = false


#) Browse to ``http(s)://<hostname>/install`` to run the installer and set up
   an admin account.

#) Run salt to reconfigure the ``/etc/gogs/app.ini`` file and set the correct
   permissions on the config directory::

     salt-call state.apply --output-diff

----

Alternatively you could manually create the admin user by inserting a new row
in the ``user`` table in the database. Some details on this can be found in the
followin puppet gogs module:

* https://github.com/Siteminds/puppet-gogs#special-notes


Available states
================

.. contents::
    :local:

``gogs``
--------

Installs the Gogs files from an archive, creates the gogs user, and starts the
service.

``gogs.config``
---------------

Manages the Gogs configuration file.

``gogs.directories``
--------------------

Creates and manages the Gogs data, logs, and repositories directories.

``gogs.logrotate``
------------------

Manages the rotation of the Gogs log files.
