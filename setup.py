#!/usr/bin/python
import re
import os
import sys
import platform
from distutils.core import setup, Command


__version__ = '1.0.0'
__author__ = 'Taylor "Nekroze" Embrace'
__email__ = 'nekroze@eturnilnetwork.com'
SOURCE = 'pde'
TESTDIR = '.'
PROJECTNAME = 'Python-DevEnv'
PROJECTSITE = 'http://github.com/Nekroze/Python-DevEnv'
PROJECTDESC = \
'PDE is a simple development environment setup script for python projects.'
PROJECTLICENSE = 'MIT'

SCRIPTS = ['pde']

EXTENSIONS = []  # DEFINE YOURSELF if compiled extensions are needed


PYLINT = True
PYTHON = 'python'
if platform.system() != 'Windows' and sys.version_info[0] == 3:
    PYTHON = 'python3'


class Test(Command):
    """Run test suite."""
    description = "Run test suite"
    user_options = []

    def initialize_options(self):
        """pass."""
        pass

    def finalize_options(self):
        """pass."""
        pass

    def run(self):
        """Run unittests."""
        if os.system(PYTHON + ' -m unittest discover ' + TESTDIR + ' "*.py"'):
            sys.exit(1)


class Style(Command):
    """Check style with pylint."""
    description = "Run pylint on source code."
    user_options = []

    def initialize_options(self):
        """pass."""
        pass

    def finalize_options(self):
        """pass."""
        pass

    def run(self):
        """Run pylint."""
        if not os.system('pylint --rcfile=.pylintrc ' + SOURCE):
            print("Pylint reports no inconsistencies.")
        else:
            sys.exit(1)


class Prep(Command):
    """Prepare code by running style check and test suite and freezing."""
    description = "Run test suite"
    user_options = []

    def initialize_options(self):
        """pass."""
        pass

    def finalize_options(self):
        """pass."""
        pass

    def run(self):
        if os.system(PYTHON + ' setup.py test'):
            sys.exit(1)
        if PYLINT and os.system(PYTHON + ' setup.py style'):
            sys.exit(1)


class GitCommit(Command):
    """Git add and commit with message."""
    description = "Git commit."
    user_options = [('message=', 'm', 'Git commit message.')]

    def initialize_options(self):
        """Set message to None by default."""
        self.message = None

    def finalize_options(self):
        """pass."""
        pass

    def run(self):
        """Run git add and commit with message if provided."""
        if os.system('git add .'):
            sys.exit(1)
        if self.message is not None:
            os.system('git commit -a -m "' + self.message + '"')
        else:
            os.system('git commit -a')

			
vRe = re.compile(r'__version__\s*=\s*(\S+)', re.M)
data = open('setup.py').read()

kwds = {}
kwds['version'] = eval(vRe.search(data).group(1))
kwds['description'] = PROJECTDESC
kwds['long_description'] = open('README.rst').read()
kwds['license'] = PROJECTLICENSE


setup(
    cmdclass={
        'style': Style,
        'test': Test,
        'prep': Prep,
        'commit': GitCommit},

    name=PROJECTNAME,
    author=__author__,
    author_email=__email__,
    url=PROJECTSITE,
    ext_modules = EXTENSIONS,
    scripts=SCRIPTS,
    classifiers=[        
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 3',
        'Topic :: Software Development',
        'Topic :: Software Development :: Testing',
        'Topic :: Utilities'
    ],
    **kwds
)
