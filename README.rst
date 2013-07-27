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

PDE is undergoing a makeover currently and its repo version is unusable.

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
