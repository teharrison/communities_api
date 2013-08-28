

function CommunitiesAPI(url, auth, auth_cb) {

    var _url = url;
    var deprecationWarningSent = false;
    
    function deprecationWarning() {
        if (!deprecationWarningSent) {
            deprecationWarningSent = true;
            if (!window.console) return;
            console.log(
                "DEPRECATION WARNING: '*_async' method names will be removed",
                "in a future version. Please use the identical methods without",
                "the'_async' suffix.");
        }
    }

    var _auth = auth ? auth : { 'token' : '', 'user_id' : ''};
    var _auth_cb = auth_cb;


    this.post_compute_normalize = function (PostComputeNormalizeParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_compute_normalize",
        [PostComputeNormalizeParams], 1, _callback, _errorCallback);
};

    this.post_compute_normalize_async = function (PostComputeNormalizeParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_compute_normalize", [PostComputeNormalizeParams], 1, _callback, _error_callback);
    };

    this.post_compute_heatmap = function (PostComputeHeatmapParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_compute_heatmap",
        [PostComputeHeatmapParams], 1, _callback, _errorCallback);
};

    this.post_compute_heatmap_async = function (PostComputeHeatmapParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_compute_heatmap", [PostComputeHeatmapParams], 1, _callback, _error_callback);
    };

    this.post_compute_pcoa = function (PostComputePcoaParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_compute_pcoa",
        [PostComputePcoaParams], 1, _callback, _errorCallback);
};

    this.post_compute_pcoa_async = function (PostComputePcoaParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_compute_pcoa", [PostComputePcoaParams], 1, _callback, _error_callback);
    };

    this.get_download_instance = function (GetDownloadInstanceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_download_instance",
        [GetDownloadInstanceParams], 1, _callback, _errorCallback);
};

    this.get_download_instance_async = function (GetDownloadInstanceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_download_instance", [GetDownloadInstanceParams], 1, _callback, _error_callback);
    };

    this.get_download_setlist = function (GetDownloadSetlistParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_download_setlist",
        [GetDownloadSetlistParams], 1, _callback, _errorCallback);
};

    this.get_download_setlist_async = function (GetDownloadSetlistParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_download_setlist", [GetDownloadSetlistParams], 1, _callback, _error_callback);
    };

    this.get_inbox_view = function (GetInboxViewParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_inbox_view",
        [GetInboxViewParams], 1, _callback, _errorCallback);
};

    this.get_inbox_view_async = function (GetInboxViewParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_inbox_view", [GetInboxViewParams], 1, _callback, _error_callback);
    };

    this.post_inbox_upload = function (PostInboxUploadParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_inbox_upload",
        [PostInboxUploadParams], 1, _callback, _errorCallback);
};

    this.post_inbox_upload_async = function (PostInboxUploadParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_inbox_upload", [PostInboxUploadParams], 1, _callback, _error_callback);
    };

    this.get_library_query = function (GetLibraryQueryParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_library_query",
        [GetLibraryQueryParams], 1, _callback, _errorCallback);
};

    this.get_library_query_async = function (GetLibraryQueryParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_library_query", [GetLibraryQueryParams], 1, _callback, _error_callback);
    };

    this.get_library_instance = function (GetLibraryInstanceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_library_instance",
        [GetLibraryInstanceParams], 1, _callback, _errorCallback);
};

    this.get_library_instance_async = function (GetLibraryInstanceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_library_instance", [GetLibraryInstanceParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_ontology = function (GetM5nrOntologyParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_ontology",
        [GetM5nrOntologyParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_ontology_async = function (GetM5nrOntologyParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_ontology", [GetM5nrOntologyParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_taxonomy = function (GetM5nrTaxonomyParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_taxonomy",
        [GetM5nrTaxonomyParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_taxonomy_async = function (GetM5nrTaxonomyParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_taxonomy", [GetM5nrTaxonomyParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_sources = function (_callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_sources",
        [], 1, _callback, _errorCallback);
};

    this.get_m5nr_sources_async = function (_callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_sources", [], 1, _callback, _error_callback);
    };

    this.get_m5nr_accession = function (GetM5nrAccessionParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_accession",
        [GetM5nrAccessionParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_accession_async = function (GetM5nrAccessionParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_accession", [GetM5nrAccessionParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_md5 = function (GetM5nrMd5Params, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_md5",
        [GetM5nrMd5Params], 1, _callback, _errorCallback);
};

    this.get_m5nr_md5_async = function (GetM5nrMd5Params, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_md5", [GetM5nrMd5Params], 1, _callback, _error_callback);
    };

    this.get_m5nr_function = function (GetM5nrFunctionParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_function",
        [GetM5nrFunctionParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_function_async = function (GetM5nrFunctionParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_function", [GetM5nrFunctionParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_organism = function (GetM5nrOrganismParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_organism",
        [GetM5nrOrganismParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_organism_async = function (GetM5nrOrganismParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_organism", [GetM5nrOrganismParams], 1, _callback, _error_callback);
    };

    this.get_m5nr_sequence = function (GetM5nrSequenceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_m5nr_sequence",
        [GetM5nrSequenceParams], 1, _callback, _errorCallback);
};

    this.get_m5nr_sequence_async = function (GetM5nrSequenceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_m5nr_sequence", [GetM5nrSequenceParams], 1, _callback, _error_callback);
    };

    this.post_m5nr_accession = function (PostM5nrAccessionParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_m5nr_accession",
        [PostM5nrAccessionParams], 1, _callback, _errorCallback);
};

    this.post_m5nr_accession_async = function (PostM5nrAccessionParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_m5nr_accession", [PostM5nrAccessionParams], 1, _callback, _error_callback);
    };

    this.post_m5nr_md5 = function (PostM5nrMd5Params, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_m5nr_md5",
        [PostM5nrMd5Params], 1, _callback, _errorCallback);
};

    this.post_m5nr_md5_async = function (PostM5nrMd5Params, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_m5nr_md5", [PostM5nrMd5Params], 1, _callback, _error_callback);
    };

    this.post_m5nr_function = function (PostM5nrFunctionParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_m5nr_function",
        [PostM5nrFunctionParams], 1, _callback, _errorCallback);
};

    this.post_m5nr_function_async = function (PostM5nrFunctionParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_m5nr_function", [PostM5nrFunctionParams], 1, _callback, _error_callback);
    };

    this.post_m5nr_organism = function (PostM5nrOrganismParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_m5nr_organism",
        [PostM5nrOrganismParams], 1, _callback, _errorCallback);
};

    this.post_m5nr_organism_async = function (PostM5nrOrganismParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_m5nr_organism", [PostM5nrOrganismParams], 1, _callback, _error_callback);
    };

    this.post_m5nr_sequence = function (PostM5nrSequenceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_m5nr_sequence",
        [PostM5nrSequenceParams], 1, _callback, _errorCallback);
};

    this.post_m5nr_sequence_async = function (PostM5nrSequenceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_m5nr_sequence", [PostM5nrSequenceParams], 1, _callback, _error_callback);
    };

    this.get_matrix_organism = function (GetMatrixOrganismParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_matrix_organism",
        [GetMatrixOrganismParams], 1, _callback, _errorCallback);
};

    this.get_matrix_organism_async = function (GetMatrixOrganismParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_matrix_organism", [GetMatrixOrganismParams], 1, _callback, _error_callback);
    };

    this.get_matrix_function = function (GetMatrixFunctionParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_matrix_function",
        [GetMatrixFunctionParams], 1, _callback, _errorCallback);
};

    this.get_matrix_function_async = function (GetMatrixFunctionParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_matrix_function", [GetMatrixFunctionParams], 1, _callback, _error_callback);
    };

    this.get_matrix_feature = function (GetMatrixFeatureParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_matrix_feature",
        [GetMatrixFeatureParams], 1, _callback, _errorCallback);
};

    this.get_matrix_feature_async = function (GetMatrixFeatureParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_matrix_feature", [GetMatrixFeatureParams], 1, _callback, _error_callback);
    };

    this.get_metadata_template = function (_callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metadata_template",
        [], 1, _callback, _errorCallback);
};

    this.get_metadata_template_async = function (_callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metadata_template", [], 1, _callback, _error_callback);
    };

    this.get_metadata_cv = function (_callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metadata_cv",
        [], 1, _callback, _errorCallback);
};

    this.get_metadata_cv_async = function (_callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metadata_cv", [], 1, _callback, _error_callback);
    };

    this.get_metadata_export = function (GetMetadataExportParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metadata_export",
        [GetMetadataExportParams], 1, _callback, _errorCallback);
};

    this.get_metadata_export_async = function (GetMetadataExportParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metadata_export", [GetMetadataExportParams], 1, _callback, _error_callback);
    };

    this.post_metadata_validate = function (PostMetadataValidateParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.post_metadata_validate",
        [PostMetadataValidateParams], 1, _callback, _errorCallback);
};

    this.post_metadata_validate_async = function (PostMetadataValidateParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.post_metadata_validate", [PostMetadataValidateParams], 1, _callback, _error_callback);
    };

    this.get_metadata_validate = function (GetMetadataValidateParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metadata_validate",
        [GetMetadataValidateParams], 1, _callback, _errorCallback);
};

    this.get_metadata_validate_async = function (GetMetadataValidateParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metadata_validate", [GetMetadataValidateParams], 1, _callback, _error_callback);
    };

    this.get_metagenome_query = function (GetMetagenomeQueryParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metagenome_query",
        [GetMetagenomeQueryParams], 1, _callback, _errorCallback);
};

    this.get_metagenome_query_async = function (GetMetagenomeQueryParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metagenome_query", [GetMetagenomeQueryParams], 1, _callback, _error_callback);
    };

    this.get_metagenome_instance = function (GetMetagenomeInstanceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_metagenome_instance",
        [GetMetagenomeInstanceParams], 1, _callback, _errorCallback);
};

    this.get_metagenome_instance_async = function (GetMetagenomeInstanceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_metagenome_instance", [GetMetagenomeInstanceParams], 1, _callback, _error_callback);
    };

    this.get_project_query = function (GetProjectQueryParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_project_query",
        [GetProjectQueryParams], 1, _callback, _errorCallback);
};

    this.get_project_query_async = function (GetProjectQueryParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_project_query", [GetProjectQueryParams], 1, _callback, _error_callback);
    };

    this.get_project_instance = function (GetProjectInstanceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_project_instance",
        [GetProjectInstanceParams], 1, _callback, _errorCallback);
};

    this.get_project_instance_async = function (GetProjectInstanceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_project_instance", [GetProjectInstanceParams], 1, _callback, _error_callback);
    };

    this.get_sample_query = function (GetSampleQueryParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_sample_query",
        [GetSampleQueryParams], 1, _callback, _errorCallback);
};

    this.get_sample_query_async = function (GetSampleQueryParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_sample_query", [GetSampleQueryParams], 1, _callback, _error_callback);
    };

    this.get_sample_instance = function (GetSampleInstanceParams, _callback, _errorCallback) {
    return json_call_ajax("CommunitiesAPI.get_sample_instance",
        [GetSampleInstanceParams], 1, _callback, _errorCallback);
};

    this.get_sample_instance_async = function (GetSampleInstanceParams, _callback, _error_callback) {
        deprecationWarning();
        return json_call_ajax("CommunitiesAPI.get_sample_instance", [GetSampleInstanceParams], 1, _callback, _error_callback);
    };
 

    /*
     * JSON call using jQuery method.
     */
    function json_call_ajax(method, params, numRets, callback, errorCallback) {
        var deferred = $.Deferred();

        if (typeof callback === 'function') {
           deferred.done(callback);
        }

        if (typeof errorCallback === 'function') {
           deferred.fail(errorCallback);
        }

        var rpc = {
            params : params,
            method : method,
            version: "1.1",
            id: String(Math.random()).slice(2),
        };
        
        var beforeSend = null;
        var token = (_auth_cb && typeof _auth_cb === 'function') ? _auth_cb()
            : (_auth.token ? _auth.token : null);
        if (token != null) {
            beforeSend = function (xhr) {
                xhr.setRequestHeader("Authorization", token);
            }
        }

        jQuery.ajax({
            url: _url,
            dataType: "text",
            type: 'POST',
            processData: false,
            data: JSON.stringify(rpc),
            beforeSend: beforeSend,
            success: function (data, status, xhr) {
                var result;
                try {
                    var resp = JSON.parse(data);
                    result = (numRets === 1 ? resp.result[0] : resp.result);
                } catch (err) {
                    deferred.reject({
                        status: 503,
                        error: err,
                        url: _url,
                        resp: data
                    });
                    return;
                }
                deferred.resolve(result);
            },
            error: function (xhr, textStatus, errorThrown) {
                var error;
                if (xhr.responseText) {
                    try {
                        var resp = JSON.parse(xhr.responseText);
                        error = resp.error;
                    } catch (err) { // Not JSON
                        error = "Unknown error - " + xhr.responseText;
                    }
                } else {
                    error = "Unknown Error";
                }
                deferred.reject({
                    status: 500,
                    error: error
                });
            }
        });
        return deferred.promise();
    }
}


