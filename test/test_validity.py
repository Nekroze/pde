import unittest
import os
import sys

class TestValidity(unittest.TestCase):
    def test_validity(self):
        """Generate a pde setup.py and test to make sure its atleast valid."""
        arglist = []
        arglist.append('--name "TestProject"')
        arglist.append('--description "Simple test project"')
        arglist.append('--author "Nekroze"')
        arglist.append('--email "nekroze@eturnilnetwork.com"')
        arglist.append('--website "nekroze.eturnilnetwork.com"')
        arglist.append('--projversion "1.0.0"')
        arglist.append('--projlicense "MIT"')
        arglist.append('--platforms "*nix, Windows"')
        arglist.append('--source "src"')
        arglist.append('--test "test"')
        arglist.append('--tester "nose"')

        args = ''
        for arg in arglist:
            args += ' ' + arg

        if os.system('python pde -p -g --outputdir test_output' + args):
            sys.exit(1)

        if os.system('python test_output/setup.py --help-commands'):
            sys.exit(1)
        
if __name__ == "__main__":
    unittest.main()
