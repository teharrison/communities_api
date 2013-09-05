#!/usr/bin/env python

import sys
import urllib
from operator import itemgetter
from optparse import OptionParser
from communities import *

API_URL = "http://kbase.us/services/communities/1"

prehelp = """
NAME
    mg-display-statistics

VERSION
    1

SYNOPSIS
    mg-display-statistics --id [ --help, --user <user>, --pass <password>, --token <oAuth token> ]

DESCRIPTION
    Retrieve statistical overview data for a metagenome from the communities API.
"""

posthelp = """
Output
    -

EXAMPLES
    mg-display-statistics --id mgm4440026.3

SEE ALSO
    -

AUTHORS
    Jared Bischof, Travis Harrison, Tobias Paczian, Andreas Wilke
"""

def main(args):
    OptionParser.format_description = lambda self, formatter: self.description
    OptionParser.format_epilog = lambda self, formatter: self.epilog
    parser = OptionParser(usage='', description=prehelp, epilog=posthelp)
    parser.add_option("", "--id", dest="id", default=None, help="KBase Metagenome ID")
    parser.add_option("", "--url", dest="url", default=API_URL, help="communities API url")
    parser.add_option("", "--user", dest="user", default=None, help="username")
    parser.add_option("", "--passwd", dest="passwd", default=None, help="password")
    parser.add_option("", "--token", dest="token", default=None, help="OAuth token")
    
    # get inputs
    (opts, args) = parser.parse_args()
    if not opts.id:
        sys.stderr.write("ERROR: id required\n")
        sys.exit(1)
    
    # get auth
    token = get_auth_token(opts)
    
    # build call url
    url = opts.url+'/metagenome/'+opts.id+'?verbosity=stats';

    # retrieve data
    result = obj_from_url(url, auth=token)
    selected = {};
    selected['ontology'] = result['statistics']['ontology'];
    selected['taxonomy'] = result['statistics']['taxonomy'];
    selected['sequence_stats'] = result['statistics']['sequence_stats'];
    
    # output data
    for d in result['statistics']['ontology']:
        sys.stdout.write(json.dumps(selected));
    
    return 0
    

if __name__ == "__main__":
    sys.exit( main(sys.argv) )
