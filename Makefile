export CLUSTER_NAME?=acs-kubernetes-demo
export RESOURCE_GROUP?=acs-kubernetes-demo
export LOCATION?=westeurope

create-cluster:
	-az group create --name $(RESOURCE_GROUP) --location $(LOCATION) --output table
	az acs create --name $(CLUSTER_NAME) --dns-prefix $(CLUSTER_NAME) --resource-group $(RESOURCE_GROUP) --orchestrator-type kubernetes


get-cli:
	az acs kubernetes install-cli --install-location ./kubectl


# RUN THIS WITH SSH-AGENT!!!
get-credentials:
	az acs kubernetes get-credentials --resource-group $(RESOURCE_GROUP) --name=$(CLUSTER_NAME) --ssh-key-file ~/.ssh/id_rsa

# List endpoints
list-endpoints:
	az network public-ip list --query '[].{dnsSettings:dnsSettings.fqdn}' --resource-group $(RESOURCE_GROUP) --output table

