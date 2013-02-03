Python-DevEnv
-------------

PDE is a simple development environment setup script for python
projects. It will ask you a series of questions about your project and
then generate an appropriate setup.py file and an accompanying
README.rst as well as, if enabled through the -p switch, a .pylintrc
file pre-configured with some useful settings that are a little more
liberal then the basic options but still very useful.

Usage
=====

usage: pde [-h] [-p] [-g]

Python-DevEnv is a simple setup script generator to help with starting a
python project. It can automatically generate pylint configs and easy setup
script commands for unittesting, style testing and git support.

optional arguments:
  -h, --help       show this help message and exit
  -p, --pylint     Enable pylint integration
  -g, --gitignore  Generate .gitignore file for python

Output Usage
============

The generated setup script will have additional commands that should
be useful when working on any python project.

`python setup.py test`: Automatically run unittest discovery
on the provided test directory.

`python setup.py style`: Run pylint style checking on the source
directory provided. If the -p switch was not used when running PDE
then this will do nothing by default and there will be no .pylintrc
file in the project directory.

`python setup.py prep`: Will run the test and style command, handy to
ensure that everything is working before a distribution or commit.

`python setup.py commit [-m message]`: Allows simple git integration by
running `git add .` followed by a `git commit` with an optional
message provided by the -m switch.

License
=======
PDE is under the MTI license so you are free to use it for anything at
all you want or modify it in any way you want! Just trying to be
helpful.

Feedback
========
If you have any suggestions or questions about PDE feel free to email
me at nekroze@eturnilnetwork.com and leave an issue report at the
GitHub repository http://github.com/Nekroze/Python-DevEnv if you
encounter any errors or problems with PDE.
