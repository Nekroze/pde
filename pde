#!/usr/bin/python
from __future__ import print_function
import argparse
import sys
import os
import subprocess

__version__ = '1.2.1'
__author__ = 'Taylor "Nekroze" Lawson'
__email__ = 'nekroze@eturnilnetwork.com'

PDE_SETUP = """#!/usr/bin/python
from setuptools import setup


__version__ = '{VERSION}'
__author__ = '{AUTHOR}'
__email__ = '{EMAIL}'
SOURCE = '{SOURCE}'
TESTDIR = '{TESTDIR}'
PROJECTNAME = '{PROJECTNAME}'
PROJECTSITE = '{PROJECTSITE}'
PROJECTDESC = \
'{PROJECTDESC}'
PROJECTLICENSE = '{PROJECTLICENSE}'
PLATFORMS = {PLATFORMS}
TESTER = '{TESTER}'

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
    platforms=PLATFORMS,
    packages=[SOURCE],
    setup_requires = [],
    install_requires = [],
    classifiers=[
        # DEFINE YOURSELF
    ],
    **kwds
)
"""

PDE_GITIGNORE = """
*.py[cod]

# C extensions
*.so

# Packages
*.egg
*.egg-info
dist
_build
build
eggs
parts
bin
var
sdist
develop-eggs
.installed.cfg
lib
lib64
__pycache__

# Installer logs
pip-log.txt

# Unit test / coverage reports
.coverage
.tox
nosetests.xml

# Translations
*.mo

# Mr Developer
*.e4p
*.e5p
.eric4project
.eric5project
.ropeproject
*.nja
*.eproject
.mr.developer.cfg
.project
.pydevproject
"""

PDE_TOX = """[tox]
envlist =
    py27, py33, style

[testenv]
deps =
    pytest
commands =
    py.test --basetemp={envtmpdir} --durations=1

[testenv:style]
basepython=python
deps=
    pylint
    flake8
commands=
    flake8 {SOURCE}
    pylint --rcfile=.pylintrc {SOURCE}
"""

PROJECT_INFO = {}
OUTPUTDIR = ''


def ensure_dir(f):
    d = os.path.dirname(f)
    if d != '' and not os.path.exists(d):
        os.makedirs(d)


def get_input(message = '', default = None):
    """Python 2 and 3 compatible get input method.
    Takes a message to display and a default input
    that is returned if nothing is inputted.
    """
    if default is None:
        sys.stdout.write(message + '\n>')
    else:
        sys.stdout.write(message + '\n[' + default + ']>')
    output = sys.stdin.readline().strip()

    if output:
        return output
    else:
        return default


def store_input(key, message = '', default = None):
    """Gets input and stores it in the PROJECT_INFO dictionary.
    Will skip any keys that are already set.
    """
    if PROJECT_INFO.get(key, None) is None:
        PROJECT_INFO[key] = get_input( \
            message + '?', default)


def collect_information():
    """Collects all the information required for PDE setup"""
    store_input('{PROJECTNAME}', 'What is the name of the project', 'MyProject')
    store_input('{AUTHOR}', 'What is the name of the author')
    store_input('{EMAIL}', 'What is the email address for this project')
    store_input('{PROJECTSITE}', 'What is the website for this project')
    store_input('{VERSION}', 'What is the current version of this project', \
        '1.0.0')
    store_input('{PROJECTDESC}', 'A short description of this project')
    store_input('{PROJECTLICENSE}', 'What license is this project under', \
        'MIT')
    store_input('{SOURCE}', 'Where is the project source located', \
        PROJECT_INFO['{PROJECTNAME}'].lower())
    store_input('{TESTDIR}', 'What is the unittest directory', \
        'test')
    sdir = PROJECT_INFO['{SOURCE}']
    if sdir:
        ensure_dir(sdir)
    tdir = PROJECT_INFO['{TESTDIR}']
    if tdir:
        ensure_dir(tdir)


def setup_pylint():
    """Generates a default .pylintrc file to disk"""
    proc = subprocess.Popen(["pylint", "--generate-rcfile"],
                            stdout=subprocess.PIPE, shell=True)
    filename = os.path.join(OUTPUTDIR, '.pylintrc')
    open(filename, 'w').write(str(proc.communicate()[0]))


def setup_tox():
    """Setup a tox.ini file."""
    setup_pylint()
    base = PDE_TOX
    for key, value in PROJECT_INFO.items():
        base = base.replace(key, str(value))
    filename = os.path.join(OUTPUTDIR, 'tox.ini')
    open(filename, 'w').write(base)


def create_setup():
    """Replace all PROJECT_INFO keys in the setup.py base
    with the PROJECT_INFO values and output to file.
    """
    global OUTPUTDIR
    if PROJECT_INFO.get('{PLATFORMS}', None) is None:
        PROJECT_INFO['{PLATFORMS}'] = ''
    PROJECT_INFO['{PLATFORMS}'] = \
        [string.strip() for string in PROJECT_INFO['{PLATFORMS}'].split(',')]
    base = PDE_SETUP
    for key, value in PROJECT_INFO.items():
        base = base.replace(key, str(value))

    filename = os.path.join(OUTPUTDIR, 'setup.py')
    ensure_dir(filename)
    open(filename, 'w').write(base)


def create_readme():
    """Create a basic README.rst file solong as one doesnt already exit.
    Uses previously defined project name and description for the body.
    """
    global OUTPUTDIR
    filename = os.path.join(OUTPUTDIR, 'README.rst')
    ensure_dir(filename)
    if os.path.exists(filename):
        return None

    with open(os.path.join(OUTPUTDIR, 'README.rst'), 'w') as readme:
        readme.write(str(PROJECT_INFO['{PROJECTNAME}']) + '\n')
        readme.write('-' * len(str(PROJECT_INFO['{PROJECTNAME}'])))
        readme.write('\n\n' + str(PROJECT_INFO['{PROJECTDESC}']))


def handle_info_defaults(args):
    """Takes in the command line information args for storage."""
    def assign_if(arg, key):
        if arg:
            PROJECT_INFO[key] = arg

    global OUTPUTDIR
    OUTPUTDIR = os.path.join(OUTPUTDIR, args.outputdir)

    assign_if(args.name, '{PROJECTNAME}')
    assign_if(args.author, '{AUTHOR}')
    assign_if(args.description, '{PROJECTDESC}')
    assign_if(args.projversion, '{VERSION}')
    assign_if(args.email, '{EMAIL}')
    assign_if(args.website, '{PROJECTSITE}')
    assign_if(args.projlicense, '{PROJECTLICENSE}')
    assign_if(args.platforms, '{PLATFORMS}')
    assign_if(args.source, '{SOURCE}')
    assign_if(args.test, '{TESTDIR}')
    assign_if(args.tester, '{TESTER}')


def driver():
    """Drive the usage of pde and its command line argument parser."""
    parser = argparse.ArgumentParser(description = \
    """Python-DevEnv is a simple setup script generator to help with starting
    a python project. It can automatically generate pylint configs and easy
    setup.py script commands for unittesting, style testing and git support.

    All questions can be overridden with command line arguments as detailed below.""")
    parser.add_argument("-p", "--pylint", help="Generate .pylintrc file for pylint",
                    action="store_true", default = False)
    parser.add_argument("-t", "--tox", help="""Generate tox.ini file for tox with
pylint and flake8 style checking and pytest unittesting""",
                    action="store_true", default = False)
    parser.add_argument("-g", "--gitignore", help="Generate .gitignore file with python and cython settings",
                    action="store_true", default = False)
    parser.add_argument("-v", "--version", help="Python-DevEnv version display",
                    action="store_true", default = False)
    parser.add_argument("-o", "--outputdir", help="Output directory",
                        type=str, default = '')
    parser.add_argument("--name", help="Project name",
                        type=str, default = '')
    parser.add_argument("--description", help="Project description",
                        type=str, default = '')
    parser.add_argument("--author", help="Project Author name",
                        type=str, default = '')
    parser.add_argument("--email", help="Project/Author email address",
                        type=str, default = '')
    parser.add_argument("--website", help="Project website url",
                        type=str, default = '')
    parser.add_argument("--projversion", help="Project version",
                        type=str, default = '')
    parser.add_argument("--projlicense", help="Project license",
                        type=str, default = '')
    parser.add_argument("--source", help="Project source code location",
                        type=str, default = '')
    parser.add_argument("--test", help="Project unittest code location",
                        type=str, default = '')
    args = parser.parse_args()

    if args.version:
        print('Python-DevEnv v' + __version__)
        sys.exit(0)

    PROJECT_INFO['{PYLINT}'] = args.pylint
    PROJECT_INFO['{TOX}'] = args.tox
    if args.tox:
        PROJECT_INFO['{PYLINT}'] = True

    handle_info_defaults(args)

    global OUTPUTDIR
    if args.gitignore:
        filename = os.path.join(OUTPUTDIR, '.gitignore')
        ensure_dir(filename)
        open(filename, 'w').write(PDE_GITIGNORE)

    collect_information()

    if PROJECT_INFO['{PYLINT}'] is True:
        setup_pylint()
    if PROJECT_INFO['{TOX}'] is True:
        setup_tox()

    create_readme()
    create_setup()

    print("Your Python-DevEnv has been created, enjoy!")


if __name__ == '__main__':
    driver()
