try:
    import json
except ImportError:
    import sys
    sys.path.append('simplejson-2.3.3')
    import simplejson as json
    
import urllib



class CommunitiesAPI:

    def __init__(self, url):
        if url != None:
            self.url = url

    def get_abundanceprofile_instance(self, get_abundanceprofile_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_abundanceprofile_instance',
                     'params': [get_abundanceprofile_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_library_query(self, get_library_query_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_library_query',
                     'params': [get_library_query_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_library_instance(self, get_library_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_library_instance',
                     'params': [get_library_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_metagenome_query(self, get_metagenome_query_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_metagenome_query',
                     'params': [get_metagenome_query_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_metagenome_instance(self, get_metagenome_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_metagenome_instance',
                     'params': [get_metagenome_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_project_query(self, get_project_query_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_project_query',
                     'params': [get_project_query_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_project_instance(self, get_project_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_project_instance',
                     'params': [get_project_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sample_query(self, get_sample_query_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sample_query',
                     'params': [get_sample_query_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sample_instance(self, get_sample_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sample_instance',
                     'params': [get_sample_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sequences_md5(self, get_sequences_md5_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sequences_md5',
                     'params': [get_sequences_md5_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sequences_annotation(self, get_sequences_annotation_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sequences_annotation',
                     'params': [get_sequences_annotation_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sequenceset_instance(self, get_sequenceset_instance_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sequenceset_instance',
                     'params': [get_sequenceset_instance_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None

    def get_sequenceset_setlist(self, get_sequenceset_setlist_params):

        arg_hash = { 'method': 'CommunitiesAPI.get_sequenceset_setlist',
                     'params': [get_sequenceset_setlist_params],
                     'version': '1.1'
                     }

        body = json.dumps(arg_hash)
        resp_str = urllib.urlopen(self.url, body).read()
        resp = json.loads(resp_str)

        if 'result' in resp:
            return resp['result'][0]
        else:
            return None




        
