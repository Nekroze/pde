#!/usr/bin/python
from setuptools import setup


__version__ = '1.3.0'
__author__ = 'Taylor "Nekroze" Embrace'
__email__ = 'nekroze@eturnilnetwork.com'
SOURCE = 'pde'
TESTDIR = 'test'
PROJECTNAME = 'pde'
PROJECTSITE = 'http://github.com/Nekroze/Python-DevEnv'
PROJECTDESC = \
'PDE is a simple development environment setup script for python projects.'
PROJECTLICENSE = 'MIT'
PLATFORMS = ['*nix', 'Windows']

SCRIPTS = ['pde']

kwds = {}
kwds['version'] = __version__
kwds['description'] = PROJECTDESC
kwds['long_description'] = open('README.rst').read()
kwds['license'] = PROJECTLICENSE


setup(
    name=PROJECTNAME,
    author=__author__,
    author_email=__email__,
    url=PROJECTSITE,
    scripts=SCRIPTS,
    platforms = PLATFORMS,
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
