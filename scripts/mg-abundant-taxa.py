import sys
import urllib
from optparse import OptionParser
from communities import *

API_URL = "http://kbase.us/services/communities/1"

__doc__ = """
NAME
    mg-abundant-taxa

VERSION
    1

SYNOPSIS
    mg-abundant-taxa --id [ --help, --user <user>, --pass <password>, --token <oAuth token>, --level, --source, --top, --evalue, --identity, --length ]

DESCRIPTION
    Retrieve top abuntant taxa for metagenome from communities API.

  Options
    ##options detailed default##
    ##options detailed##

  Output
    ##outputs##

EXAMPLES
    ##example##

SEE ALSO
    ##related##

AUTHORS
    Jared Bischof, Travis Harrison, Tobias Paczian, Andreas Wilke
"""

def main(args):
    parser = OptionParser(usage=__doc__)
    parser.add_option("", "--id", dest="id", default=None, help="KBase Metagenome ID")
    parser.add_option("", "--url", dest="url", default=API_URL, help="communities API url")
    parser.add_option("", "--user", dest="user", default=None, help="username")
    parser.add_option("", "--pass", dest="pass", default=None, help="password")
    parser.add_option("", "--token", dest="token", default=None, help="OAuth token")
    parser.add_option("", "--level", dest="level", default='species', help="Taxon level to retrieve abundaces for")
    parser.add_option("", "--source", dest="source", default='SEED', help="datasource to filter results by")
    parser.add_option("", "--top", dest="top", default=10, help="display only the top N taxa")
    parser.add_option("", "--evalue", dest="evalue", default=5, help="negative exponent value for maximum e-value cutoff")
    parser.add_option("", "--identity", dest="identity", default=60, help="percent value for minimum % identity cutoff")
    parser.add_option("", "--length", dest="length", default=15, help="value for minimum alignment length cutoff")
    
    # get inputs
    (opts, _) = parser.parse_args()
    if not opts.id:
        sys.stderr.write("ERROR: id required\n")
        sys.exit(1)
    
    # get auth
    
    
    # build matrix url
    params = [ ('id', opts.id),
               ('group_level', opts.level), 
               ('source', opts.source),
               ('evalue', opts.evalue),
               ('identity', opts.identity),
               ('length', opts.length),
               ('result_type', 'abundance') ]
    url = opts.url+'/matrix/organism?'+urllib.urlencode(params, True)
    
    

if __name__ == "__main__":
    sys.exit( main(sys.argv) )