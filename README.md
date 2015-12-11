Playground project for [IOcaml Kernel](https://github.com/andrewray/iocaml/) ([Jupyter](http://jupyter.org/) project).

Successfully used this playground to write a final task for the course [Introduction to Functional Programming in OCaml](https://www.france-universite-numerique-mooc.fr/courses/parisdiderot/56002/session01/about)

Technically, project uses Docker to build an image that runs Jupyter with IOcaml preconfigured.

Usage
-----

Build:

    docker build --force-rm=true -t oh-my-ocaml 

Run container:

    docker run -it -v /abspath/to/folder/with/notebooks:/root/notebooks -P oh-my-ocaml

Known issues
------------

- Highlighting is not working, only for the cells that are initially loaded with notebook.
