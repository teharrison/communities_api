TOP_DIR = ../..
TOOLS_DIR = $(TOP_DIR)/tools
DEPLOY_RUNTIME ?= /kb/runtime
TARGET ?= /kb/deployment
include $(TOOLS_DIR)/Makefile.common

SERVICE = communities_api
SERVICE_DIR = $(TARGET)/services/$(SERVICE)
SERVICE_URL = http://kbase.us/services/communities/1

# things needed for testing
TESTS = $(wildcard test/client-tests/*.t) 

default:
	@echo "nothing to do for default make"

deploy: deploy-client

deploy-all: deploy

all: deploy

clean:
	rm -f api-scripts/mg-*
	rm -f lib/C*
	rm -f docs/C*
	@echo "All clean"

deploy-client: build-libs deploy-libs build-scripts deploy-scripts build-docs deploy-docs
	mkdir -p $(SERVICE_DIR)
	@echo "Client tools deployed"

build-libs:
	perl common/bin/api2js.pl -url $(SERVICE_URL) -outfile docs/CommunitiesAPI.json
	perl common/bin/definition2typedef.pl -json docs/CommunitiesAPI.json -typedef docs/CommunitiesAPI.typedef -service CommunitiesAPI
	compile_typespec --impl CommunitiesAPI --js CommunitiesAPI --py CommunitiesAPI docs/CommunitiesAPI.typedef lib
	@echo "Done building typespec libs"

build-scripts:
	perl common/bin/generate_commandline.pl -template common/template -config config/commandline.conf -outdir api-scripts
	cp api-scripts/* scripts/.
	@echo "Done building command line scripts"

build-docs:
	perl common/bin/api2html.pl -url $(SERVICE_URL) -site_name "Communities API" -outfile docs/Communities_API.html
	pod2html --infile=lib/CommunitiesAPIClient.pm --outfile=docs/CommunitiesAPI.html --title="Communities API Client"

deploy-docs:
	mkdir -p $(SERVICE_DIR)/webroot
	cp docs/*.html $(SERVICE_DIR)/webroot/.

test: test-client

test-client:
	for t in $(TESTS); do \
		echo $$t; \
		$(KB_RUNTIME)/bin/perl $$t; \
		if [ $$? -ne 0 ]; then \
			exit 1; \
		fi \
	done


include $(TOOLS_DIR)/Makefile.common.rules
