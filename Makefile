TARGET ?= /kb/deployment
DEPLOY_RUNTIME ?= /kb/runtime
SERVICE = communities_api
SERVICE_DIR = $(TARGET)/services/$(SERVICE)
SERVICE_URL = http://kbase.us/services/communities/1

TOP_DIR = ../..
TOOLS_DIR = $(TOP_DIR)/tools
WRAP_PERL_TOOL = wrap_perl
WRAP_PERL_SCRIPT = bash $(TOOLS_DIR)/$(WRAP_PERL_TOOL).sh
SRC_PERL   = $(wildcard scripts/*.pl)
SRC_PYTHON = $(wildcard scripts/*.py) 


include $(TOOLS_DIR)/Makefile.common


# to wrap scripts and deploy them to $(TARGET)/bin using tools in the dev_container

# things needed for testing
TESTS = $(wildcard test/client-tests/*.t) 

default:
	@echo "nothing to do for default make"

deploy: deploy-client

deploy-all: deploy-client

deploy-client: build-libs deploy-libs build-scripts deploy-scripts build-docs deploy-docs
	if [ ! -d $(SERVICE_DIR) ]; then mkdir -p $(SERVICE_DIR); fi
	if [ ! -d $(TARGET)/lib ]; then mkdir -p $(TARGET)/lib; fi
	cp client/* $(TARGET)/lib
	@echo "Client tools deployed"

build-libs:
	perl common/bin/api2js.pl -url $(SERVICE_URL) -outfile docs/CommunitiesAPI.json
	perl common/bin/definition2typedef.pl -json docs/CommunitiesAPI.json -typedef docs/CommunitiesAPI.typedef
#	-compile_typespec --impl CommunitiesAPI --js CommunitiesAPI --py CommunitiesAPI docs/CommunitiesAPI.typedef lib
	@echo "Done building typespec libs"

build-scripts:
	perl common/bin/generate_commandline.pl -template common/conf/template -config common/conf/config -outdir api-scripts
	cp api-scripts/* scripts/.

# deploy-scripts:
# 	if [ ! -d $(TARGET)/bin ]; then mkdir -p $(TARGET)/bin; fi
# 	if [ ! -d $(TARGET)/plbin ]; then mkdir -p $(TARGET)/plbin; fi
# 	export KB_TOP=$(TARGET); \
# 	export KB_RUNTIME=$(DEPLOY_RUNTIME); \
# 	export KB_PERL_PATH=$(TARGET)/lib:$(TARGET)/lib/perl5 bash; \
# 	for src in $(SRC_PERL); do \
# 		basefile=`basename $$src`; \
# 		base=`basename $$src .pl`; \
# 		echo install $$src $$base; \
# 		cp $$src $(TARGET)/plbin; \
# 		$(WRAP_PERL_SCRIPT) "$(TARGET)/plbin/$$basefile" $(TARGET)/bin/$$base; \
# 	done

build-docs:
	perl common/bin/api2html.pl -url $(SERVICE_URL) -site_name "Communities API" -outfile docs/Communities_API.html
	pod2html --infile=lib/CommunitiesAPIClient.pm --outfile=docs/CommunitiesAPI.html --title="Communities API Client"

deploy-docs:
	if [ ! -d $(TARGET)/services/$(SERVICE)/webroot/ ]; then mkdir -p $(TARGET)/services/$(SERVICE)/webroot/; fi
	cp docs/*.html $(TARGET)/services/$(SERVICE)/webroot

test: test-client

test-client:
	for t in $(TESTS); do \
		echo $$t; \
		$(KB_RUNTIME)/bin/perl $$t; \
		if [ $$? -ne 0 ]; then \
			exit 1; \
		fi \
	done




-include $(TOOLS_DIR)/Makefile.common.rules
