TOP_DIR = ../..
include $(TOP_DIR)/tools/Makefile.common

SRC_PERL = $(wildcard scripts/*.pl)
BIN_PERL = $(addprefix $(BIN_DIR)/,$(basename $(notdir $(SRC_PERL))))

DEPLOY_PERL = $(addprefix $(TARGET)/bin/,$(basename $(notdir $(SRC_PERL))))

SERVER_SPEC = CommunitiesServer-API.spec
SERVER_MODULE = CommunitiesServerAPI
SERVICE = communitiesServer

SERVICE_DIR = $(TARGET)/services/$(SERVICE)

TPAGE = $(DEPLOY_RUNTIME)/bin/tpage
TPAGE_ARGS = --define kb_top=$(TARGET) --define kb_runtime=$(DEPLOY_RUNTIME) --define kb_service_name=$(SERVICE)

RPACKAGES = Cairo_1.5-1.tar.gz ecodist_1.2.5.tar.gz RJSONIO_0.98-1.tar.gz matlab_0.8.9.tar.gz gdata_2.8.2.tar.gz gtools_2.6.2.tar.gz bitops_1.0-4.1.tar.gz caTools_1.12.tar.gz gplots_2.10.1.tar.gz


all: bin server

what:
	@echo $(BIN_PERL)

server: lib/$(SERVER_MODULE)Server.pm

lib/$(SERVER_MODULE)Server.pm: $(SERVER_SPEC)
	compile_typespec $(SERVER_SPEC) lib

bin: $(BIN_PERL)

$(BIN_DIR)/%: scripts/%.pl 
	$(TOOLS_DIR)/wrap_perl '$$KB_TOP/modules/$(CURRENT_DIR)/$<' $@

deploy: deploy-dir deploy-scripts deploy-libs deploy-R deploy-services

deploy-dir:
	if [ ! -d $(SERVICE_DIR) ] ; then mkdir $(SERVICE_DIR) ; fi

deploy-scripts:
	export KB_TOP=$(TARGET); \
	export KB_RUNTIME=$(DEPLOY_RUNTIME); \
	export KB_PERL_PATH=$(TARGET)/lib bash ; \
	for src in $(SRC_PERL) ; do \
		basefile=`basename $$src`; \
		base=`basename $$src .pl`; \
		echo install $$src $$base ; \
		cp $$src $(TARGET)/plbin ; \
		bash $(TOOLS_DIR)/wrap_perl.sh "$(TARGET)/plbin/$$basefile" $(TARGET)/bin/$$base ; \
	done 

deploy-libs:
	rsync -arv lib/. $(TARGET)/lib/.
	rsync -arv rpc-server/lib/. $(TARGET)/lib/.

deploy-R:
	for P in $(RPACKAGES); do \
		R CMD INSTALL R/dependances/$(P); \
	done; \
	R CMD INSTALL R/KbaseKit.tar

deploy-services:
	$(TPAGE) $(TPAGE_ARGS) rpc-server/service/start_service.tt > $(TARGET)/services/$(SERVICE)/start_service
	chmod +x $(TARGET)/services/$(SERVICE)/start_service
	$(TPAGE) $(TPAGE_ARGS) rpc-server/service/stop_service.tt > $(TARGET)/services/$(SERVICE)/stop_service
	chmod +x $(TARGET)/services/$(SERVICE)/stop_service
