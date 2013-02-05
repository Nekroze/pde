#!/usr/bin/python
from __future__ import print_function
import argparse
import sys
import os

__version__ = '1.2.1'
__author__ = 'Taylor "Nekroze" Lawson'
__email__ = 'nekroze@eturnilnetwork.com'

PDE_PYLINT = '''
[MASTER]

# Specify a configuration file.
#rcfile=

# Python code to execute, usually for sys.path manipulation such as
# pygtk.require().
#init-hook=

# Profiled execution.
profile=no

# Add files or directories to the blacklist. They should be base names, not
# paths.
ignore=CVS

# Pickle collected data for later comparisons.
persistent=yes

# List of plugins (as comma separated values of python modules names) to load,
# usually to register additional checkers.
load-plugins=


[MESSAGES CONTROL]

# Enable the message, report, category or checker with the given id(s). You can
# either give multiple identifier separated by comma (,) or put this option
# multiple time.
#enable=

# Disable the message, report, category or checker with the given id(s). You
# can either give multiple identifier separated by comma (,) or put this option
# multiple time (only on the command line, not in the configuration file where
# it should appear only once).
disable=C0111, W0201


[REPORTS]

# Set the output format. Available formats are text, parseable, colorized, msvs
# (visual studio) and html. You can also give a reporter class, eg
# mypackage.mymodule.MyReporterClass.
output-format=text

# Include message's id in output
include-ids=yes

# Include symbolic ids of messages in output
symbols=no

# Put messages in a separate file for each module / package specified on the
# command line instead of printing them on stdout. Reports (if any) will be
# written in a file name "pylint_global.[txt|html]".
files-output=no

# Tells whether to display a full report or only the messages
reports=no

# Python expression which should return a note less than 10 (10 is the highest
# note). You have access to the variables errors warning, statement which
# respectively contain the number of errors / warnings messages and the total
# number of statements analyzed. This is used by the global evaluation report
# (RP0004).
evaluation=10.0 - ((float(5 * error + warning + refactor + convention) / statement) * 10)

# Add a comment according to your evaluation note. This is used by the global
# evaluation report (RP0004).
comment=no


[TYPECHECK]

# Tells whether missing members accessed in mixin class should be ignored. A
# mixin class is detected if its name ends with "mixin" (case insensitive).
ignore-mixin-members=yes

# List of classes names for which member attributes should not be checked
# (useful for classes with attributes dynamically set).
ignored-classes=SQLObject

# When zope mode is activated, add a predefined set of Zope acquired attributes
# to generated-members.
zope=no

# List of members which are set dynamically and missed by pylint inference
# system, and so shouldn't trigger E0201 when accessed. Python regular
# expressions are accepted.
generated-members=REQUEST,acl_users,aq_parent


[FORMAT]

# Maximum number of characters on a single line.
max-line-length=80

# Maximum number of lines in a module
max-module-lines=2000

# String used as indentation unit. This is usually " " (4 spaces) or "\t" (1
# tab).
indent-string='    '


[BASIC]

# Required attributes for module, separated by a comma
required-attributes=

# List of builtins function names that should not be used, separated by a comma
bad-functions=map,filter,apply,input

# Regular expression which should only match correct module names
module-rgx=(([a-z_][a-z0-9_]*)|([A-Z][a-zA-Z0-9]+))$

# Regular expression which should only match correct module level names
const-rgx=(([A-Z_][A-Z0-9_]*)|(__.*__))$

# Regular expression which should only match correct class names
class-rgx=[A-Z_][a-zA-Z0-9]+$

# Regular expression which should only match correct function names
function-rgx=[a-z_][a-z0-9_]{2,30}$

# Regular expression which should only match correct method names
method-rgx=[a-z_][a-z0-9_]{2,30}$

# Regular expression which should only match correct instance attribute names
attr-rgx=[a-z_][a-z0-9_]{2,30}$

# Regular expression which should only match correct argument names
argument-rgx=[a-z_][a-z0-9_]{2,30}$

# Regular expression which should only match correct variable names
variable-rgx=[a-z_][a-z0-9_]{2,30}$

# Regular expression which should only match correct list comprehension /
# generator expression variable names
inlinevar-rgx=[A-Za-z_][A-Za-z0-9_]*$

# Good variable names which should always be accepted, separated by a comma
good-names=i,j,k,ex,Run,_

# Bad variable names which should always be refused, separated by a comma
bad-names=foo,bar,baz,toto,tutu,tata

# Regular expression which should only match functions or classes name which do
# not require a docstring
no-docstring-rgx=__.*__


[VARIABLES]

# Tells whether we should check for unused import in __init__ files.
init-import=no

# A regular expression matching the beginning of the name of dummy variables
# (i.e. not used).
dummy-variables-rgx=_|dummy

# List of additional names supposed to be defined in builtins. Remember that
# you should avoid to define new builtins when possible.
additional-builtins=


[SIMILARITIES]

# Minimum lines number of a similarity.
min-similarity-lines=4

# Ignore comments when computing similarities.
ignore-comments=yes

# Ignore docstrings when computing similarities.
ignore-docstrings=yes

# Ignore imports when computing similarities.
ignore-imports=no


[MISCELLANEOUS]

# List of note tags to take in consideration, separated by a comma.
notes=FIXME,XXX,TODO


[DESIGN]

# Maximum number of arguments for function / method
max-args=5

# Argument names that match this expression will be ignored. Default to name
# with leading underscore
ignored-argument-names=_.*

# Maximum number of locals for function / method body
max-locals=15

# Maximum number of return / yield for function / method body
max-returns=10

# Maximum number of branch for function / method body
max-branchs=30

# Maximum number of statements in function / method body
max-statements=100

# Maximum number of parents for a class (see R0901).
max-parents=7

# Maximum number of attributes for a class (see R0902).
max-attributes=7

# Minimum number of public methods for a class (see R0903).
min-public-methods=0

# Maximum number of public methods for a class (see R0904).
max-public-methods=50


[CLASSES]

# List of interface methods to ignore, separated by a comma. This is used for
# instance to not check methods defines in Zope's Interface base class.
ignore-iface-methods=isImplementedBy,deferred,extends,names,namesAndDescriptions,queryDescriptionFor,getBases,getDescriptionFor,getDoc,getName,getTaggedValue,getTaggedValueTags,isEqualOrExtendedBy,setTaggedValue,isImplementedByInstancesOf,adaptWith,is_implemented_by

# List of method names used to declare (i.e. assign) instance attributes.
defining-attr-methods=__init__,__new__,setUp

# List of valid names for the first argument in a class method.
valid-classmethod-first-arg=cls

# List of valid names for the first argument in a metaclass class method.
valid-metaclass-classmethod-first-arg=mcs


[IMPORTS]

# Deprecated modules which should not be used, separated by a comma
deprecated-modules=regsub,string,TERMIOS,Bastion,rexec

# Create a graph of every (i.e. internal and external) dependencies in the
# given file (report RP0402 must not be disabled)
import-graph=

# Create a graph of external dependencies in the given file (report RP0402 must
# not be disabled)
ext-import-graph=

# Create a graph of internal dependencies in the given file (report RP0402 must
# not be disabled)
int-import-graph=


[EXCEPTIONS]

# Exceptions that will emit a warning when being caught. Defaults to
# "Exception"
overgeneral-exceptions=Exception
'''

PDE_SETUP = '''#!/usr/bin/python
import re
import os
import sys
import platform
from distutils.core import setup, Command


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
'''

PDE_GITIGNORE = '''
*.py[cod]

# C extensions
*.so

# Packages
*.egg
*.egg-info
dist
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
.mr.developer.cfg
.project
.pydevproject
'''

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
    store_input('{PLATFORMS}', 'Comma sperated list of platforms for this project')
    store_input('{SOURCE}', 'Where is the project source located', \
        PROJECT_INFO['{PROJECTNAME}'].lower())
    store_input('{TESTDIR}', 'What is the unittest directory', \
        'test')


def setup_pylint():
    """Saves the stored .pylintrc file to disk"""
    global OUTPUTDIR
    filename = os.path.join(OUTPUTDIR, '.pylintrc')
    ensure_dir(filename)
    open(filename, 'w').write(PDE_PYLINT)


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


def driver():
    """Drive the usage of pde and its command line argument parser."""
    parser = argparse.ArgumentParser(description = \
    """Python-DevEnv is a simple setup script generator to help with starting
    a python project. It can automatically generate pylint configs and easy
    setup.py script commands for unittesting, style testing and git support.

    All questions can be overridden with command line arguments as detailed below.""")
    parser.add_argument("-p", "--pylint", help="Generate .pylintrc file for pylint",
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
    parser.add_argument("--platforms", help="Project platforms, comma seperated string", 
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

    handle_info_defaults(args)

    global OUTPUTDIR
    if args.gitignore:
        filename = os.path.join(OUTPUTDIR, '.gitignore')
        ensure_dir(filename)
        open(filename, 'w').write(PDE_GITIGNORE)

    collect_information()

    if PROJECT_INFO['{PYLINT}'] == True:
        setup_pylint()

    create_readme()
    create_setup()

    print("Your Python-DevEnv has been created, enjoy!")


if __name__ == '__main__':
    driver()
