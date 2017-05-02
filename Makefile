export CLUSTER_NAME?=acs-kubernetes
export RESOURCE_GROUP?=acs-kubernetes

create-cluster:
	az acs create --name $(CLUSTER_NAME) --dns-prefix $(CLUSTER_NAME) --resource-group $(RESOURCE_GROUP) --orchestrator-type kubernetes


get-cli:
	az acs kubernetes install-cli --install-location ./kubectl


get-credentials:
	az acs kubernetes get-credentials --resource-group $(RESOURCE_GROUP) --name=$(CLUSTER_NAME)

