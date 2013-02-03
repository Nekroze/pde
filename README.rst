Python-DevEnv
-------------

PDE is a simple development environment setup script for Python
projects. 

It will ask you a series of questions about your project, then 
generate an appropriate ``setup.py`` and ``README.rst``.  

Additionally, it can generate (via the ``-p`` switch) a 
``.pylintrc`` with some useful settings for Pylint. The settings
are a little more liberal then the basic options, but still very 
useful.


Usage
=====

``usage: pde [-h] [-p] [-g]``

**Python-DevEnv** is a simple setup script generator to help start
Python projects. It can automatically generate ``pylint`` configuration,
and has easy ``setup.py`` commands for unittesting, style testing, and 
git support.

**Optional arguments:**::

    -h, --help       show this help message and exit
    -p, --pylint     Enable pylint integration
    -g, --gitignore  Generate .gitignore file for python


Output Usage
============

The generated setup script has additional commands that should
be useful when working on any Python project.

``python setup.py test``: Automatically run ``unittest`` discovery
on the provided test directory.

``python setup.py style``: Run pylint style checking on the source
directory provided. If the -p switch was not used when running PDE
then this will do nothing by default and there will be no .pylintrc
file in the project directory.

``python setup.py prep``: Will run the test and style command, handy to
ensure that everything is working before a distribution or commit.

``python setup.py commit [-m message]``: Allows simple git integration by
running `git add .` followed by a `git commit` with an optional
message provided by the -m switch.


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
