# Makefile for running terraform without having to actually change the terraform variables
# Changes needed:
# 		- addtional variables for cluster
# 		- installing jupyterhub
# 		- creating an autopilot cluster
# 		- 

create-cluster: LOCATION ?= us-central1
create-cluster: NAME ?= ml-cluster
create-cluster:
	terraform apply -auto-approve \
	-var region=$(LOCATION) \
	-var cluster_name=$(NAME) \
	&& $(MAKE) gcloud-auth-cluster 

gcloud-auth-cluster: gcloud container clusters get-credentials $(NAME) --location $(LOCATION)

delete-cluster: 
	terraform destroy -auto-approve