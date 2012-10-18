TARGET = /kb/deployment
SERVICE = communities_api
SERVICE_DIR = $(TARGET)/services/$(SERVICE)

all: deploy

deploy: deploy-services

deploy-services:
	if [ ! -d $(SERVICE_DIR) ]; then mkdir -p $(SERVICE_DIR); fi
	if [ ! -d $(TARGET)/lib ]; then mkdir -p $(TARGET)/lib; fi
	cp client/* $(TARGET)/lib
