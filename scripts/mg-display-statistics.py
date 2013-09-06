#!/usr/bin/env python

import sys
import urllib
from operator import itemgetter
from optparse import OptionParser
from communities import *

prehelp = """
NAME
    mg-display-statistics

VERSION
    %s

SYNOPSIS
    mg-display-statistics [ --help, --user <user>, --pass <password>, --token <oAuth token>, --id <metagenome id>, --stat <cv: 'sequence', taxa_level> ]

DESCRIPTION
    Retrieve statistical overview data for a metagenome from the communities API.
"""

posthelp = """
Output
    -

EXAMPLES
    mg-display-statistics --id "kb|mg.287" --stat sequence

SEE ALSO
    -

AUTHORS
    %s
"""

def main(args):
    OptionParser.format_description = lambda self, formatter: self.description
    OptionParser.format_epilog = lambda self, formatter: self.epilog
    parser = OptionParser(usage='', description=prehelp%VERSION, epilog=posthelp%AUTH_LIST)
    parser.add_option("", "--id", dest="id", default=None, help="KBase Metagenome ID")
    parser.add_option("", "--url", dest="url", default=API_URL, help="communities API url")
    parser.add_option("", "--user", dest="user", default=None, help="OAuth username")
    parser.add_option("", "--passwd", dest="passwd", default=None, help="OAuth password")
    parser.add_option("", "--token", dest="token", default=None, help="OAuth token")
    parser.add_option("", "--stat", dest="stat", default='sequence', help="type of stat to display, use keyword 'sequence' or taxa level name")
    
    # get inputs
    (opts, args) = parser.parse_args()
    if not opts.id:
        sys.stderr.write("ERROR: id required\n")
        return 1
    
    # get auth
    token = get_auth_token(opts)
    
    # build call url
    if opts.id.startswith('kb|'):
        opts.id = kbid_to_mgid(opts.id)
    url = opts.url+'/metagenome/'+opts.id+'?verbosity=stats'

    # retrieve / output data
    result = obj_from_url(url, auth=token)
    if opts.stat == 'sequence':
        for s in sorted(result['statistics']['sequence_stats'].iterkeys()):
            sys.stdout.write("%s\t%s\n" %(s, result['statistics']['sequence_stats'][s]))
    elif opts.stat in result['statistics']['taxonomy']:
        for s in result['statistics']['taxonomy'][opts.stat]:
            sys.stdout.write("%s\t%s\n" %(s[0], s[1]))
    else:
        sys.stderr.write("ERROR: invalid stat type\n")
        return 1
    
    return 0    

if __name__ == "__main__":
    sys.exit( main(sys.argv) )
