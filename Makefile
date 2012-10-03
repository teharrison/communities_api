DEPLOY = /kb/deployment
SERVICE = communities_api
SERVICE_DIR = $(DEPLOY)/services/$(SERVICE)

all: deploy

deploy: deploy-services

deploy-services:
	if [ ! -d $(SERVICE_DIR) ]; then mkdir -p $(SERVICE_DIR); fi
	if [ ! -d $(DEPLOY)/lib ]; then mkdir -p $(DEPLOY)/lib; fi
	cp -R scripts $(SERVICE_DIR)/.
	cp service/* $(SERVICE_DIR)
	cp client/* $(DEPLOY)/lib
