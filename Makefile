TARGET = /kb/deployment
DEPLOY_RUNTIME = /kb/runtime
SERVICE = communities_api
SERVICE_DIR = $(TARGET)/services/$(SERVICE)

# to wrap scripts and deploy them to $(TARGET)/bin using tools in the dev_container
TOP_DIR = ../..
TOOLS_DIR = $(TOP_DIR)/tools
WRAP_PERL_TOOL = wrap_perl
WRAP_PERL_SCRIPT = bash $(TOOLS_DIR)/$(WRAP_PERL_TOOL).sh
SRC_PERL = $(wildcard scripts/*.pl)

# things needed for testing
TESTS = $(wildcard test/*.t) 

all: deploy

deploy: deploy-client deploy-scripts

deploy-client:
	if [ ! -d $(SERVICE_DIR) ]; then mkdir -p $(SERVICE_DIR); fi
	if [ ! -d $(TARGET)/lib ]; then mkdir -p $(TARGET)/lib; fi
	cp client/* $(TARGET)/lib

deploy-scripts:
	if [ ! -d $(TARGET)/bin ]; then mkdir -p $(TARGET)/bin; fi
	if [ ! -d $(TARGET)/plbin ]; then mkdir -p $(TARGET)/plbin; fi
	export KB_TOP=$(TARGET); \
	export KB_RUNTIME=$(DEPLOY_RUNTIME); \
	export KB_PERL_PATH=$(TARGET)/lib:$(TARGET)/lib/perl5 bash ; \
	for src in $(SRC_PERL) ; do \
		basefile=`basename $$src`; \
		base=`basename $$src .pl`; \
		echo install $$src $$base ; \
		cp $$src $(TARGET)/plbin ; \
		$(WRAP_PERL_SCRIPT) "$(TARGET)/plbin/$$basefile" $(TARGET)/bin/$$base ; \
	done

test: test-client

test-client:
	for t in $(TESTS) ; do \
		echo $$t ; \
		$(KB_RUNTIME)/bin/perl $$t ; \
		if [ $$? -ne 0 ] ; then \
			exit 1 ; \
		fi \
	done
