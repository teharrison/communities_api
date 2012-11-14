

function CommunitiesAPI(url) {

    var _url = url;


    this.get_abundanceprofile_instance = function(get_abundanceprofile_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_abundanceprofile_instance", [get_abundanceprofile_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_abundanceprofile_instance", [get_abundanceprofile_instance_params]);
        return resp[0];
    }

    this.get_abundanceprofile_instance_async = function(get_abundanceprofile_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_abundanceprofile_instance", [get_abundanceprofile_instance_params], 1, _callback, _error_callback)
    }

    this.get_library_query = function(get_library_query_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_library_query", [get_library_query_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_library_query", [get_library_query_params]);
        return resp[0];
    }

    this.get_library_query_async = function(get_library_query_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_library_query", [get_library_query_params], 1, _callback, _error_callback)
    }

    this.get_library_instance = function(get_library_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_library_instance", [get_library_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_library_instance", [get_library_instance_params]);
        return resp[0];
    }

    this.get_library_instance_async = function(get_library_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_library_instance", [get_library_instance_params], 1, _callback, _error_callback)
    }

    this.get_metagenome_query = function(get_metagenome_query_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_metagenome_query", [get_metagenome_query_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_metagenome_query", [get_metagenome_query_params]);
        return resp[0];
    }

    this.get_metagenome_query_async = function(get_metagenome_query_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_metagenome_query", [get_metagenome_query_params], 1, _callback, _error_callback)
    }

    this.get_metagenome_instance = function(get_metagenome_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_metagenome_instance", [get_metagenome_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_metagenome_instance", [get_metagenome_instance_params]);
        return resp[0];
    }

    this.get_metagenome_instance_async = function(get_metagenome_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_metagenome_instance", [get_metagenome_instance_params], 1, _callback, _error_callback)
    }

    this.get_project_query = function(get_project_query_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_project_query", [get_project_query_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_project_query", [get_project_query_params]);
        return resp[0];
    }

    this.get_project_query_async = function(get_project_query_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_project_query", [get_project_query_params], 1, _callback, _error_callback)
    }

    this.get_project_instance = function(get_project_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_project_instance", [get_project_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_project_instance", [get_project_instance_params]);
        return resp[0];
    }

    this.get_project_instance_async = function(get_project_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_project_instance", [get_project_instance_params], 1, _callback, _error_callback)
    }

    this.get_sample_query = function(get_sample_query_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sample_query", [get_sample_query_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sample_query", [get_sample_query_params]);
        return resp[0];
    }

    this.get_sample_query_async = function(get_sample_query_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sample_query", [get_sample_query_params], 1, _callback, _error_callback)
    }

    this.get_sample_instance = function(get_sample_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sample_instance", [get_sample_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sample_instance", [get_sample_instance_params]);
        return resp[0];
    }

    this.get_sample_instance_async = function(get_sample_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sample_instance", [get_sample_instance_params], 1, _callback, _error_callback)
    }

    this.get_sequences_md5 = function(get_sequences_md5_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sequences_md5", [get_sequences_md5_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sequences_md5", [get_sequences_md5_params]);
        return resp[0];
    }

    this.get_sequences_md5_async = function(get_sequences_md5_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sequences_md5", [get_sequences_md5_params], 1, _callback, _error_callback)
    }

    this.get_sequences_annotation = function(get_sequences_annotation_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sequences_annotation", [get_sequences_annotation_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sequences_annotation", [get_sequences_annotation_params]);
        return resp[0];
    }

    this.get_sequences_annotation_async = function(get_sequences_annotation_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sequences_annotation", [get_sequences_annotation_params], 1, _callback, _error_callback)
    }

    this.get_sequenceset_instance = function(get_sequenceset_instance_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sequenceset_instance", [get_sequenceset_instance_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sequenceset_instance", [get_sequenceset_instance_params]);
        return resp[0];
    }

    this.get_sequenceset_instance_async = function(get_sequenceset_instance_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sequenceset_instance", [get_sequenceset_instance_params], 1, _callback, _error_callback)
    }

    this.get_sequenceset_list = function(get_sequenceset_list_params)
    {
	var resp = json_call_ajax_sync("CommunitiesAPI.get_sequenceset_list", [get_sequenceset_list_params]);
//	var resp = json_call_sync("CommunitiesAPI.get_sequenceset_list", [get_sequenceset_list_params]);
        return resp[0];
    }

    this.get_sequenceset_list_async = function(get_sequenceset_list_params, _callback, _error_callback)
    {
	json_call_ajax_async("CommunitiesAPI.get_sequenceset_list", [get_sequenceset_list_params], 1, _callback, _error_callback)
    }

    function _json_call_prepare(url, method, params, async_flag)
    {
	var rpc = { 'params' : params,
		    'method' : method,
		    'version': "1.1",
	};
	
	var body = JSON.stringify(rpc);
	
	var http = new XMLHttpRequest();
	
	http.open("POST", url, async_flag);
	
	//Send the proper header information along with the request
	http.setRequestHeader("Content-type", "application/json");
	//http.setRequestHeader("Content-length", body.length);
	//http.setRequestHeader("Connection", "close");
	return [http, body];
    }

    /*
     * JSON call using jQuery method.
     */

    function json_call_ajax_sync(method, params)
    {
        var rpc = { 'params' : params,
                    'method' : method,
                    'version': "1.1",
        };
        
        var body = JSON.stringify(rpc);
        var resp_txt;
	var code;
        
        var x = jQuery.ajax({       "async": false,
                                    dataType: "text",
                                    url: _url,
                                    success: function (data, status, xhr) { resp_txt = data; code = xhr.status },
				    error: function(xhr, textStatus, errorThrown) { resp_txt = xhr.responseText, code = xhr.status },
                                    data: body,
                                    processData: false,
                                    type: 'POST',
				    });

        var result;

        if (resp_txt)
        {
	    var resp = JSON.parse(resp_txt);
	    
	    if (code >= 500)
	    {
		throw resp.error;
	    }
	    else
	    {
		return resp.result;
	    }
        }
	else
	{
	    return null;
	}
    }

    function json_call_ajax_async(method, params, num_rets, callback, error_callback)
    {
        var rpc = { 'params' : params,
                    'method' : method,
                    'version': "1.1",
        };
        
        var body = JSON.stringify(rpc);
        var resp_txt;
	var code;
        
        var x = jQuery.ajax({       "async": true,
                                    dataType: "text",
                                    url: _url,
                                    success: function (data, status, xhr)
				{
				    resp = JSON.parse(data);
				    var result = resp["result"];
				    if (num_rets == 1)
				    {
					callback(result[0]);
				    }
				    else
				    {
					callback(result);
				    }
				    
				},
				    error: function(xhr, textStatus, errorThrown)
				{
				    if (xhr.responseText)
				    {
					resp = JSON.parse(xhr.responseText);
					if (error_callback)
					{
					    error_callback(resp.error);
					}
					else
					{
					    throw resp.error;
					}
				    }
				},
                                    data: body,
                                    processData: false,
                                    type: 'POST',
				    });

    }

    function json_call_async(method, params, num_rets, callback)
    {
	var tup = _json_call_prepare(_url, method, params, true);
	var http = tup[0];
	var body = tup[1];
	
	http.onreadystatechange = function() {
	    if (http.readyState == 4 && http.status == 200) {
		var resp_txt = http.responseText;
		var resp = JSON.parse(resp_txt);
		var result = resp["result"];
		if (num_rets == 1)
		{
		    callback(result[0]);
		}
		else
		{
		    callback(result);
		}
	    }
	}
	
	http.send(body);
	
    }
    
    function json_call_sync(method, params)
    {
	var tup = _json_call_prepare(url, method, params, false);
	var http = tup[0];
	var body = tup[1];
	
	http.send(body);
	
	var resp_txt = http.responseText;
	
	var resp = JSON.parse(resp_txt);
	var result = resp["result"];
	    
	return result;
    }
}

