######
kiwami
######

|forthebadge|

A personal utility repository for (more or less) reproducible setups on
Pop!_OS systems. Current version for Pop!_OS 20.04.

Also depends on `chuahou/dpkgs <https://github.com/chuahou/dpkgs>`_
hosted on `cloudsmith.io <https://cloudsmith.io/~c3hou/repos/dpkgs>`_.

Usage
=====

::

	$ mkdir -p ~/dev
	$ git clone https://github.com/chuahou/kiwami.git ~/dev/kiwami --recurse-submodules
	$ cd ~/dev/kiwami
	$ ./init.sh

Previously
==========

RIP `utility repo <https://github.com/chuahou/utility>`_

A note on history
-----------------

Some older history may be *very very very strange*. This is because a
large quantity of commits were discarded in a rebase, deleting many MBs
of Iosevka binary font files, shrinking the repo to a third of its size
(yay!). This rebase was **NOT** performed with caution, since no one
but me uses it.

If something has gone very wrong, and the old history needs to be
accessed, see `ch-graveyard/kiwami-archive
<https://github.com/ch-graveyard/kiwami-archive>`_.

.. |forthebadge| image:: https://forthebadge.com/images/badges/no-ragrets.svg
   :target: https://forthebadge.com
