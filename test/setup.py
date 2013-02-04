#!/usr/bin/python
import re
import os
import sys
import platform
from distutils.core import setup, Command


__version__ = '1.0.0'
__author__ = 'Nekroze'
__email__ = 'nekroze@eturnilnetwork.com'
SOURCE = 'src'
TESTDIR = 'test'
PROJECTNAME = 'TestProject'
PROJECTSITE = 'nekroze.eturnilnetwork.com'
PROJECTDESC = 'Simple test project'
PROJECTLICENSE = 'MIT'
PLATFORMS = ['*nix', 'Windows']

EXTENSIONS = []  # DEFINE YOURSELF if compiled extensions are needed


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
        if os.system(PYTHON + ' setup.py style'):
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


class PyPiUpload(Command):
    """Update this project at the current version to pypi."""
    description = "Update pypi."
    user_options = []

    def initialize_options(self):
        """pass."""
        pass

    def finalize_options(self):
        """pass."""
        pass

    def run(self):
        """build an sdist and then upload."""
        if os.system(PYTHON + ' setup.py sdist upload'):
            sys.exit(1)
        print('PyPi Upload successful.')

			
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
        'commit': GitCommit,
        'pypiup': PyPiUpload},

    name=PROJECTNAME,
    author=__author__,
    author_email=__email__,
    url=PROJECTSITE,
    platforms=PLATFORMS,
    packages=[SOURCE],
    ext_modules = EXTENSIONS,
    classifiers=[
        # DEFINE YOURSELF
    ],
    **kwds
)
