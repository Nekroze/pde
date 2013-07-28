Python-DevEnv
-------------

**Python-DevEnv** (PDE) is a simple development environment setup 
script for Python projects. 

It asks a series of questions about your project, then generate an 
appropriate ``setup.py`` and ``README.rst``.  

If you like, it can also generate a ``.pylintrc`` with some useful
settings for Pylint. (Use ``-p``.)  The settings are a little more 
liberal then the basic options, but still very useful.

This project will not be maintained any further as **Tyrant** will be taking
over as a project setup generator and assistant with many more features then
pde could ever have. **Tyrant** can be found here https://github.com/Nekroze/tyrant


Usage
=====

usage: pde [-h] [-p] [-g] [-v] [-o OUTPUTDIR]
           [--name NAME] [--description DESCRIPTION] [--author AUTHOR]
           [--email EMAIL] [--website WEBSITE] [--projversion PROJVERSION]
           [--projlicense PROJLICENSE] [--platforms PLATFORMS]
           [--source SOURCE] [--test TEST]

Python-DevEnv is a simple setup script generator to help with starting a
python project. It can automatically generate ``pylint`` configs and easy ``setup.py``
script commands for unittesting, style testing and git support. All questions
can be overridden with command line arguments as detailed below.

**optional arguments**::
  -h, --help            show this help message and exit
  -p, --pylint          Generate .pylintrc file for pylint
  -g, --gitignore       Generate .gitignore file with python and cython
                        settings
  -v, --version         Python-DevEnv version display
  -o OUTPUTDIR, --outputdir OUTPUTDIR
                        Output directory
  --name NAME           Project name
  --description DESCRIPTION
                        Project description
  --author AUTHOR       Project Author name
  --email EMAIL         Project/Author email address
  --website WEBSITE     Project website url
  --projversion PROJVERSION
                        Project version
  --projlicense PROJLICENSE
                        Project license
  --platforms PLATFORMS
                        Project platforms, comma seperated string
  --source SOURCE       Project source code location
  --test TEST           Project unittest code location

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

You can check out more of what I am doing at
http://nekroze.eturnilnetwork.com my blog.

If you encounter any errors or problems with PDE, please let me know! Open
an Issue at  http://github.com/Nekroze/pde the GitHub repository.

Thanks!

Changelog
=========

The major version is incremented when there is a major usage change.
The minor version is incremented when new features are implemented.
The micro version is incremented for small bug fixes and are often
undocumented unless they change the user experience.

v1.3.0 - July 26 2013
 * Changed repository and pypi package name to 'pde'
 * Updated setup script to setuptools
 * Removed silly commands from setup script
 * Added tox support

v1.2.0 - February 4th 2013
 * Optional output directory
 * Optional project information overrides from the command line
 * Platforms information added

v1.1.0 - February 4th 2013
 * Clearer README thanks to Zearin
 * PyPi upload command in generated setup.py
 * Less pylint messages disabled
 * Added __pycache__ dir to .gitignore generationa.
 * Clearer -h help messages.
