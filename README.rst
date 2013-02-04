Python-DevEnv
-------------

**Python-DevEnv** (PDE) is a simple development environment setup 
script for Python projects. 

It asks a series of questions about your project, then generate an 
appropriate ``setup.py`` and ``README.rst``.  

If you like, it can also generate a ``.pylintrc`` with some useful
settings for Pylint. (Use ``-p``.)  The settings are a little more 
liberal then the basic options, but still very useful.


Usage
=====

``usage: pde [-h] [-p] [-g]``

Python-DevEnv is a simple setup script generator to help start
Python projects. It can automatically generate ``pylint`` configuration,
and has easy ``setup.py`` commands for unittesting, style testing, and 
git support.

**Optional arguments:**::

    -h, --help       show this help message and exit
    -p, --pylint     Generate .pylintrc file for pylint
    -g, --gitignore  Generate .gitignore file with python and cython settings


Output Usage
============

The generated setup script has additional commands that should
be useful when working on any Python project.

``python setup.py test``: Automatically runs ``unittest`` discovery
on the provided test directory.

``python setup.py style``: Run pylint style checking on the source
directory provided. If the ``-p`` switch was not used, this will
complain because there will be no ``.pylintrc`` file in the project
directory however one can be manually made. 

``python setup.py prep``: Will run the test and style command. Handy to
ensure that everything is working before a distribution or commit.

``python setup.py commit [-m message]``: Allows simple git integration by
running `git add .` followed by a `git commit` with an optional
message provided by the ``-m`` switch.

``python setup.py pypiup``: Performs a distutils check to ensure that
project meta data is up to spec then creates an sdist and attempts to
upload it to the PyPi package repository.

License
=======
PDE is under the MIT license, so you're free to use it for anything 
you want--or modify it any way you want! Just trying to be helpful.


Feedback
========
If you have any suggestions or questions about PDE feel free to email
me at nekroze@eturnilnetwork.com.

If you encounter any errors or problems with PDE, please let me know! Open
an Issue at the GitHub repository http://github.com/Nekroze/Python-DevEnv .

Thanks!

Changelog
=========

v1.1.0 - February 4th 2013
 * Clearer README thanks to Zearin
 * PyPi upload command in generated setup.py
 * Less pylint messages disabled
 * Added __pycache__ dir to .gitignore generationa.
 * Clearer -h help messages.
