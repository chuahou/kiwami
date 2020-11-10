######
kiwami
######

|forthebadge|

A personal utility repository for (more or less) reproducible setups on
Pop!_OS systems. Current version for Pop!_OS 20.04.

Also depends on `chuahou/dpkgs <https://github.com/chuahou/dpkgs>`_
hosted on `cloudsmith.io <https://cloudsmith.io/~c3hou/repos/dpkgs>`_.

Contents
========

* `debian <debian>`_: a series of debian packages with tools /
  dependencies, that when installed, sets up the system I need.

  * `kiwami-pkgs <debian/kiwami-pkgs>`_: a metapackage that depends on
    apt packages I want installed
  * `kiwami-scripts <debian/kiwami-scripts>`_: a collection of useful
    scripts
  * `xinit-xsession <debian/xinit-xsession>`_: a simple package
    containing a script and desktop file to run ``$HOME/.xinitrc`` from
    a display manager

* `other <other>`_: miscellanous files

* rcfiles: see `rcfiles repo <https://github.com/chuahou/rcfiles>`_

* `zsh-vim-mode <zsh-vim-mode>`_: `this plugin
  <https://github.com/softmoth/zsh-vim-mode>`_ as a submodule for easy
  installation using symlinks in `rcfiles <rcfiles>`_

* `prereq.deb <prereq.deb>`_: prebuilt binary packages, must be
  installed before we can build the debian folder

* `init.sh <init.sh>`_: script that does *everything* for a fresh
  system, including running the scripts in `init.d <init.d>`_

.. |forthebadge| image:: https://forthebadge.com/images/badges/no-ragrets.svg
   :target: https://forthebadge.com

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
