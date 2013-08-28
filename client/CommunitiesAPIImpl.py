#BEGIN_HEADER
#END_HEADER

'''

Module Name:
CommunitiesAPI

Module Description:
RESTful Microbial Communities object and resource API
For usage note that required parameters need to be passed as path parameters, optional parameters need to be query parameters. If an optional parameter has a list of option values, the first displayed will be used as default.

'''
class CommunitiesAPI:

    #BEGIN_CLASS_HEADER
    #END_CLASS_HEADER

    def __init__(self, config): #config contains contents of config file in hash or 
                                #None if it couldn't be found
        #BEGIN_CONSTRUCTOR
        #END_CONSTRUCTOR
        pass

    def post_compute_normalize(self, PostComputeNormalizeParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_compute_normalize
        #END post_compute_normalize

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_compute_normalize return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_compute_heatmap(self, PostComputeHeatmapParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_compute_heatmap
        #END post_compute_heatmap

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_compute_heatmap return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_compute_pcoa(self, PostComputePcoaParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_compute_pcoa
        #END post_compute_pcoa

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_compute_pcoa return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_download_instance(self, GetDownloadInstanceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_download_instance
        #END get_download_instance

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_download_instance return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_download_setlist(self, GetDownloadSetlistParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_download_setlist
        #END get_download_setlist

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_download_setlist return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_inbox_view(self, GetInboxViewParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_inbox_view
        #END get_inbox_view

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_inbox_view return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_inbox_upload(self, PostInboxUploadParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_inbox_upload
        #END post_inbox_upload

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_inbox_upload return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_library_query(self, GetLibraryQueryParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_library_query
        #END get_library_query

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_library_query return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_library_instance(self, GetLibraryInstanceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_library_instance
        #END get_library_instance

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_library_instance return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_ontology(self, GetM5nrOntologyParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_ontology
        #END get_m5nr_ontology

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_ontology return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_taxonomy(self, GetM5nrTaxonomyParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_taxonomy
        #END get_m5nr_taxonomy

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_taxonomy return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_sources(self, ):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_sources
        #END get_m5nr_sources

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_sources return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_accession(self, GetM5nrAccessionParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_accession
        #END get_m5nr_accession

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_accession return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_md5(self, GetM5nrMd5Params):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_md5
        #END get_m5nr_md5

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_md5 return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_function(self, GetM5nrFunctionParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_function
        #END get_m5nr_function

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_function return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_organism(self, GetM5nrOrganismParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_organism
        #END get_m5nr_organism

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_organism return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_m5nr_sequence(self, GetM5nrSequenceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_m5nr_sequence
        #END get_m5nr_sequence

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_m5nr_sequence return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_m5nr_accession(self, PostM5nrAccessionParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_m5nr_accession
        #END post_m5nr_accession

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_m5nr_accession return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_m5nr_md5(self, PostM5nrMd5Params):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_m5nr_md5
        #END post_m5nr_md5

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_m5nr_md5 return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_m5nr_function(self, PostM5nrFunctionParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_m5nr_function
        #END post_m5nr_function

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_m5nr_function return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_m5nr_organism(self, PostM5nrOrganismParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_m5nr_organism
        #END post_m5nr_organism

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_m5nr_organism return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_m5nr_sequence(self, PostM5nrSequenceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_m5nr_sequence
        #END post_m5nr_sequence

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_m5nr_sequence return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_matrix_organism(self, GetMatrixOrganismParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_matrix_organism
        #END get_matrix_organism

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_matrix_organism return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_matrix_function(self, GetMatrixFunctionParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_matrix_function
        #END get_matrix_function

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_matrix_function return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_matrix_feature(self, GetMatrixFeatureParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_matrix_feature
        #END get_matrix_feature

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_matrix_feature return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metadata_template(self, ):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metadata_template
        #END get_metadata_template

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metadata_template return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metadata_cv(self, ):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metadata_cv
        #END get_metadata_cv

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metadata_cv return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metadata_export(self, GetMetadataExportParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metadata_export
        #END get_metadata_export

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metadata_export return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def post_metadata_validate(self, PostMetadataValidateParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN post_metadata_validate
        #END post_metadata_validate

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method post_metadata_validate return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metadata_validate(self, GetMetadataValidateParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metadata_validate
        #END get_metadata_validate

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metadata_validate return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metagenome_query(self, GetMetagenomeQueryParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metagenome_query
        #END get_metagenome_query

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metagenome_query return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_metagenome_instance(self, GetMetagenomeInstanceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_metagenome_instance
        #END get_metagenome_instance

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_metagenome_instance return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_project_query(self, GetProjectQueryParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_project_query
        #END get_project_query

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_project_query return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_project_instance(self, GetProjectInstanceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_project_instance
        #END get_project_instance

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_project_instance return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_sample_query(self, GetSampleQueryParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_sample_query
        #END get_sample_query

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_sample_query return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
    def get_sample_instance(self, GetSampleInstanceParams):
        # self.ctx is set by the wsgi application class
        # return variables are: returnVal
        #BEGIN get_sample_instance
        #END get_sample_instance

        #At some point might do deeper type checking...
        if not isinstance(returnVal, dict):
            raise ValueError('Method get_sample_instance return value returnVal is not type dict as required.')
        # return the results
        return [ returnVal ]
        
