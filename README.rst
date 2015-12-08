Playground project for `IOcaml Kernel <https://github.com/andrewray/iocaml/>`_ (`Jupyter <http://jupyter.org/>`_ project).

Successfully used this playground to write a final task for the course `Introduction to Functional Programming in OCaml <https://www.france-universite-numerique-mooc.fr/courses/parisdiderot/56002/session01/about>`_

.. contents::

Details
-------
Technically, project uses Docker to build an image that runs Jupyter with IOcaml preconfigured.


Project uses not an original version of the IOcaml.
Small `fix <https://github.com/signalpillar/iocaml/commit/f8ab3dc1f5212dbf62f51eb416d0b>`_ was done
according to the following `commen <https://github.com/andrewray/iocaml/issues/35#issuecomment-121218523>`_.
This changes are required to make kernel compatible with the latest Jupyter API.

Usage
-----

Build::

    docker build --force-rm=true -t oh-my-ocaml 

Run container::

    docker run -it -v /abspath/to/folder/with/notebooks:/root/notebooks -P oh-my-ocaml

Usage:

- When notebook is loaded - restart the kernel, in menu "Kernel -> Restart".
- **Do not use TAB completion (do not confuse this with TAB for indentation)**. This feature crashes kernel even if it is started without
  `-completion` option as for now.  

Known issues
------------

- Highlighting is not working, only for the cells that are initially loaded with notebook.
- Completion on TAB doesn't work (crashes kernel) so it is not enabled.


Troubleshooting
---------------

* After notebook is loaded - restart the kernel, manually.
