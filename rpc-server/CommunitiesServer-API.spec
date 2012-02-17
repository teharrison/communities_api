/*
This module provides an interface to communities study data.
*/
module CommunitiesServerAPI
{

/*
This is a sample id for a communities study.
*/

	typedef string ComSampleID;

/*
This function gets a communities sample for the given sample id.
*/

	funcdef get_samply_by_id(ComSampleID sample_id) returns (mapping<string,string>);

/*
This is a library id for a communities study.
*/

	typedef string ComLibraryID;

/*
This function gets a communities library for a given library id.
*/

	funcdef get_library_by_id(ComLibraryID lib_id) returns(mapping<string,string>); 


/* 
This is an id of a communities metagenome.
*/

	typedef string ComMetagenomeID;

/*
This function gets a communities metagenome for a given metagenome id.
*/
	funcdef get_metagenome_by_id(ComMetagenomeID metagenome_id) returns(mapping<string,string>);

/*
This is a project id for a communities project.
*/

	typedef string ComProjectID;

/*
This function gets a communities project given a project id.
*/

	funcdef get_project_by_id(ComProjectID project_id) returns(mapping<string, string>);


};
