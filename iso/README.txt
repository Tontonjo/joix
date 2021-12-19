         Debian GNU/Linux 11.1.0 "Bullseye" - Official amd64 NETINST
                               20211009-10:07

                                             (HTML version in README.html)

                      Welcome to the exciting world of
                              Debian GNU/Linux

   This disc contains the installer for the Debian GNU/Linux distribution.
   Debian is a very extensive collection of software. But it is more. It
   is a complete Operating System (OS) for your computer. And it is free
   (as in "freedom").

   CONTENTS:
     * Introduction
     * About This Disc
     * Installing
     * Last-Minute Notes
     * Installing software using Apt
     * CD/DVD Manufacturers
     * More Information
     * Browse This Disc

Introduction
============

   An operating system is the set of basic programs and utilities that
   make your computer run. At the core of an operating system is the
   kernel. The kernel is the most fundamental program on the computer,
   which does all the basic housekeeping and lets you start other
   programs. Debian is kernel independent. It currently uses either the
   Linux or FreeBSD kernel. Most of the basic operating system tools come
   from the GNU project; hence the name GNU/Linux.

   Debian is available for various kinds of computers ("architectures").
   Check the ports page for more information.

   Read more at:

     https://www.debian.org/intro/about

About This Disc
===============

   This disc is labeled

         Debian GNU/Linux 11.1.0 "Bullseye" - Official amd64 NETINST
                               20211009-10:07

   It contains programs ("binaries") for `amd64' computers.

   This disc is a netinst image. It contains the installer and a very
   basic system. Any other packages you might want to install will be
   downloaded from the network.

   The Release Notes for "bullseye" are available on the Debian web site.

Installing
==========

   Because Debian is a complete Operating System, the installation
   procedure may seem a bit unusual. You can install Debian GNU/Linux
   either alongside your current OS, or as the only OS on your computer.

   An Installation Guide for this disc is available from the Debian web
   site.

   For the impatient ones: you can start the installation program easily
   by booting off this disc. Note that not all (esp. older) systems
   support this.

   You can also examine the /install/ directory; you might be able to
   start the installation system directly from there.

Last-Minute Notes
=================

     * This is an official release of the Debian system. Please report any
       bugs you find in the Debian Bug Tracking System; details at
       [1]bugs.debian.org.
     * If you're reporting bugs against this disc or the installation
       system, please also mention the version of this disc; this can be
       found in the file /.disk/info.

Installing software using Apt
=============================

   After installing or upgrading, Debian's packaging system can use CDs,
   DVDs, local collections, or networked servers (FTP, HTTP) to
   automatically install software from (.deb packages). This is done
   preferably with the `apt' and `aptitude' programs.

   You can install packages from the commandline using apt-get. For
   example, if you want to install the packages `commprog' and `maxgame',
   you can give the command:

     apt-get install commprog maxgame

   Note that you don't have to enter the complete path, or the `.deb'
   extension. `Apt' will figure this out itself.

   Or use aptitude for a full screen interactive selection of available
   Debian packages.

CD/DVD Manufacturers
====================

   You are completely free to manufacture and re-distribute CDs/DVDs of
   the Debian GNU/Linux Operating System, like this one. There is no
   charge from us (but of course donations are always welcome).

   For all needed information and contact addresses, please refer to:

     https://www.debian.org/CD/

More Information
================

   There is much more information present on this disc. Besides the
   already mentioned installation and upgrading procedures, this is the
   most interesting:
     * /doc/FAQ                        Debian FAQ
     * /doc/constitution.txt           The Debian Constitution
     * /doc/debian-manifesto           The Debian Manifesto
     * /doc/social-contract.txt        Debian's Social Contract
     * /doc/bug-reporting.txt          Bug reporting instructions

   Also on the Internet are many resources. To name a few:
     * https://www.debian.org/          The Debian homepage
     * https://www.debian.org/doc/      Debian Documentation
     * https://www.debian.org/support/  Debian User Support
     * https://www.tldp.org/            The Linux Documentation Project
     * https://www.linux.org/           General Linux homepage



      See the Debian contact page (https://www.debian.org/contact) for
                        information on contacting us.

References

   1. https://bugs.debian.org/
