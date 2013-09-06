#!/usr/bin/env python

import sys
import urllib
from operator import itemgetter
from optparse import OptionParser
from communities import *

API_URL = "http://kbase.us/services/communities/1"

prehelp = """
NAME
    mg-get-sequences-for-taxon

VERSION
    1

SYNOPSIS
    mg-get-sequences-for-taxon [ --help, --user <user>, --pass <password>, --token <oAuth token>, --id <metagenome id>, --name <taxon name>, --level <taxon level>, --source <datasource>, --evalue <evalue negative exponent>, --identity <percent identity>, --length <alignment length> ]

DESCRIPTION
    Retrieve taxa annotated sequences for metagenome (filtered by taxon containing inputted name) from communities API.
"""

posthelp = """
Output
    Tab-delimited list of:

EXAMPLES
    mg-get-sequences-for-taxon --id "kb|mg.287" --name Lachnospiraceae --level family --source RefSeq --evalue 15

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
    parser.add_option("", "--user", dest="user", default=None, help="OAuth username")
    parser.add_option("", "--passwd", dest="passwd", default=None, help="OAuth password")
    parser.add_option("", "--token", dest="token", default=None, help="OAuth token")
    parser.add_option("", "--name", dest="name", default=None, help="taxon name to filter by")
    parser.add_option("", "--level", dest="level", default=None, help="taxon level to filter by")
    parser.add_option("", "--source", dest="source", default='SEED', help="datasource to filter results by")
    parser.add_option("", "--evalue", dest="evalue", default=5, help="negative exponent value for maximum e-value cutoff")
    parser.add_option("", "--identity", dest="identity", default=60, help="percent value for minimum % identity cutoff")
    parser.add_option("", "--length", dest="length", default=15, help="value for minimum alignment length cutoff")
    
    # get inputs
    (opts, args) = parser.parse_args()
    if not opts.id:
        sys.stderr.write("ERROR: id required\n")
        return 1
    
    # get auth
    token = get_auth_token(opts)
    
    # build url
    if opts.id.startswith('kb|'):
        opts.id = kbid_to_mgid(opts.id)
    params = [ ('source', opts.source),
               ('evalue', opts.evalue),
               ('identity', opts.identity),
               ('length', opts.length),
               ('type', 'organism') ]
    if opts.name:
        params.append(('filter', opts.name))
        if opts.level:
            params.append(('filter_level', opts.level))
    url = opts.url+'/annotation/sequence/'+opts.id+'?'+urllib.urlencode(params, True)
    
    # output data
    stout_from_url(url, auth=token)
    
    return 0
    

if __name__ == "__main__":
    sys.exit( main(sys.argv) )