### documentation pages
### "examples" in documentation
### "tests" directory in package with test code
### list definitions contained in this file:  <nouns, verbs>

# further:
# generic methods: print, summary


############################################
### unexported globals that hold "state"
############################################

#.auth <- ""
#.server <- ""
# using global options kbase.auth and kbase.server for now

############################################
### check for servers and auth key upon
### package loading
###
### the mechanism to preserve an auth
### key is to assign it to a global symbol.
### the user then may ensure it is saved
### for the next session
###
### .auth is used and hidden, whereas 
### kbase.auth.key is exported and not used
############################################
.onAttach <- function (libname, pkgname) {
#options()["kbase.server"] <<- .kbServers()$prod
.kbase.server <<- .kbServers()$prod
success <- TRUE
# packageStartupMessage ("KbaseKit: checking servers") 
# ...
if (success) packageStartupMessage ("KbaseKit: default server set: ", .kbGetServer())

if (0 != length (grep (".kbase.auth.key", ls (1, all = TRUE), fixed = TRUE))) {
	packageStartupMessage ("KbaseKit: using existing auth key" )
#	options (kbase.auth = .kbase.auth.key)
	.kbase.auth <<- .kbase.auth.key
}
else {
	packageStartupMessage ( "KbaseKit: auth key not set" )
#	options (kbase.auth = "")
	.kbase.auth <<- ""
}
packageStartupMessage (paste (
"\nThis code is under active development.",
"Feedback, feature suggestions, and bug reports are welcome.",
#"Test codes are in the installation directory.",
#"Usage examples are included with the documentation,",
#"and a good place to start is: ?kbGet", 
sep="\n"))
}
### hooks unused for now:
### .onLoad <- function (libname, pkgname) { }
### .onUnload <- function (libname) { }
.Last.lib <- function (libpath) { 
#options (kbase.server = NULL)
#options (kbase.auth = NULL)
rm (.kbase.auth, .kbase.server)
}

### the server can be viewed and set manually
.kbGetServer <- function () { # getOption (kbase.server) }
.kbase.server }
.kbSetServer <- function ( s ) { #options (kbase.server = s) }
.kbase.server <<- s }

### simple interface to get and set the auth key.  it is set automatically upon loading, if it exists
.kbGetAuth <- function() { #getOption (kbase.auth) }
.kbase.auth }
.kbSetAuth <- function (key = NULL, save = FALSE) {
if (is.null (key) ) {
	message( "KbaseKit: Enter authorization key on a single line: " )
	key <- readLines (n=1, ok=TRUE, warn=FALSE)
}
if (save) {
	warning ("KbaseKit: authorization key set in global environment may be saved to .RData file")
	.kbase.auth.key <<- key
}
# options (kbase.auth = key)
.kbase.auth <<- key
}

############################################
### we export a routine for "raw" calls to
### the API as alternative when the high-level 
### routines break.  idea is: 
### unsophisticated but robust
############################################
.kbCallRaw <- function (call, toFile = NULL) {
if (1 == length (strsplit (call, "?" , fixed = TRUE) [[1]])) conj = "?"
else conj = "&"
urlStr <- paste (.kbGetServer(), call, conj, "auth=", .kbGetAuth(), sep = "")
message ("KbaseKit: .kbCallRaw: ", urlStr)

# if (is.null (toFile)) {
	conn <- url (urlStr)
	x <- readLines (conn, warn = FALSE)
	close (conn)
#} else { }
x
}


############################################
### these are the routines 
### that users are intended to use
############################################

### get a list of all resources of one type.  this is a convenience function for no-parameter calls
kbListAll <- function (resource) {
this.func.handles <- c ("project", "sample", "library", "annotation", "metagenome")
if ( !any (resource == this.func.handles)) {
	warning ("KbaseKit: resource must be among: ", paste (this.func.handles, collapse = " "))
	return()
}
x <- fromJSON (.kbCallRaw (resource), asText = TRUE)
switch (resource, 
	project = as.vector (x$projects),
	sample = as.vector (x$samples),
	library = as.vector (x$librarys),
	annotation = as.vector (x),
	metagenome = as.vector (x$metagenomes) )			### return R-friendly object	
}

### perform an md5 lookup in the specified annotation database
kbAnnotationLookup <- function (md5, namespace) {
warning( "KbaseKit: unimplemented function" )
}

### search metagenomes in mgrast for specified criteria
kbSearchMetagenomes <- function (resource, attribute = NULL, value = NULL) {
warning( "KbaseKit: unimplemented function" )
}

### specify a resource and get it back in an R-friendly form
### this function handles all API calls for which an ID is required
### handles: project,sample,library,annotation,metagenome,subset, sequenceSet, sequences, reads, abundanceProfile, matrix (multiple), 
kbGet <- function( 
	resource,
	ID,
	param = NULL,		### param is any string, passed directly
	type = NULL,
	source = NULL,
	seq = NULL,
	organism = NULL,
	func = NULL,
	md5 = NULL,
	parse = TRUE,
	toFile = NULL ) {

this.func.handles <- c ("project", "sample", "library", "metagenome", "subset", "sequenceSet", "sequences",  "reads", "abundanceProfile", "matrix")
if (! any(resource == this.func.handles)) {
	warning ("KbaseKit: resource must be among: ", paste (this.func.handles, collapse = " "))
	return()
}
resourceStr <- paste (switch (resource, abundanceProfile = "abundance_profile", resource), "/", sep="")
IDstr <- paste (paste (as.character (ID), collapse = ";"), "/", sep="")
# if (!is.null(param)) return (.kbCallRaw (paste (resource, IDstr, paramStr)))
paramStr <- if ( !is.null (param)) paste (param, collapse = "/", sep="") else ""

x <- .kbCallRaw (paste (resourceStr, IDstr, paramStr, sep = ""))
y <- try (fromJSON (x, asText = TRUE), silent = TRUE)
if ( !inherits (y, "try-error")) x <- y
message ("KbaseKit: ", length (unlist (x)), " elements in retrieved object")

clean = switch (resource, 
  matrix =
    (if (1 == length (grep ("format/plain", paramStr, fixed=TRUE))) {
      temp.file <- tempfile()
      writeLines (x, temp.file)
      y <- read.table (temp.file, header=TRUE, row.names=1, sep="\t", quote="", comment.char="")
      unlink (temp.file)
      y
    }
    else x),
  x)

invisible (clean)
}


############################################
### parsing functions for the idiosyncracies
### of each object type.  these pull out of
### JSON into a natural R structure
############################################

parseProject <- function (x) {
}

parseSample <- function (x) {
}

parseLibrary <- function (x) {
}

parseMetagenome <- function (x) {
}

parseSubset <- function (x) {
}

parseSequenceSet <- function (x) {
}

parseSequences <- function (x) {
}

parseAnnotation <- function (x) {
}

parseReads <- function (x) {
}

parseAbundanceProfile <- function (x) {
}

parseMatrix <- function (x) {
}

parseQuery <- function (x) {
}


############################################
### hardcoded "parameters" of the package
############################################

### provides some valid API parameters for testing conveniently
### IDs from berkeley demo: 4443360.3,4443361.3,4443362.3,4443363.3,4443364.3,4443365.3,4443366.3,4443367.3,4443368.3
.kbTestParams <- function () {
list (
project = "92", 
sample = "mgs3482", 
library = "mgl3482.4", 
metagenome = "mgm4440282.3", 
subset = "", 
sequenceSet = "", 
sequences = "", 
annotation = "", 
reads = "", 
abundanceProfile = "mgm4440282.3", 
matrix = "",
query = "")
}

### lists relevant servers
.kbServers <- function() {
list (
prod = "http://api.metagenomics.anl.gov/",
prod2 = "http://metagenomics.anl.gov/api.cgi",
dev = "http://dev.metagenomics.anl.gov/api.cgi/",
dev2 = "http://dunkirk.mcs.anl.gov/~paczian/mgrastv3/api.cgi/",
shock = "http://shock.mcs.anl.gov")
}

### valid namespaces for MG-RAST
.kbNamespaces <- function ( ) {  
list (M5NR = "M5NR", SwissProt = "SwissProt", GenBank = "GenBank", IMG = "IMG", SEED = "SEED", TrEMBL = "TrEMBL", RefSeq = "RefSeq", PATRIC = "PATRIC", eggNOG = "eggNOG", KEGG = "KEGG", RDP = "RDP", Greengenes = "Greengenes", LSU = "LSU", SSU = "SSU") 
}

### a few little things
.shew <- function (a) { print (paste (typeof (a), mode (a), class (a))); summary (a) }
.shh <- suppressPackageStartupMessages
.hold <- function (messg = NULL, cmd = NULL) { message (messg); if (!is.null (cmd)) writeLines (paste (options ("prompt"), cmd), sep=""); invisible (readLines (n=1, warn=FALSE))}

