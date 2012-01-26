
#! /usr/bin/env python
import json
import urllib
import sys

# picking example project
url = 'http://api.metagenomics.anl.gov/project/4'
u = urllib.urlopen(url)
# u is a file-like object
data = u.read()

# print raw stream
print data

# parse json object
obj = json.loads(data)

# print data structure
print obj 
