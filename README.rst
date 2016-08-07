====
Gogs
====

Formula to set up and configure the Gogs self-hosted Git service.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

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
