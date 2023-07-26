# Makefile for running terraform without having to actually change the terraform variables
# Changes needed:
# 		- addtional variables for cluster
# 		- installing jupyterhub
# 		- creating an autopilot cluster
# 		- 

init-terraform: 
	cd ./terraform/ && terraform init && gcloud auth application-default login

gcloud-auth-cluster: 
	gcloud container clusters get-credentials $(NAME) --location $(LOCATION)

plan-terraform:
	cd ./terraform/ && terraform plan

create-cluster: LOCATION ?= us-central1
create-cluster: NAME ?= ml-cluster
create-cluster: AUTOPILOT ?= false
create-cluster:
	cd ./terraform/ && \
	terraform apply -auto-approve \
	-var region=$(LOCATION) \
	-var cluster_name=$(NAME) \
	-var enable_autopilot=$(AUTOPILOT) \
	&& cd ../ && $(MAKE) gcloud-auth-cluster NAME=$(NAME) LOCATION=$(LOCATION) \
	&& echo "IP of JupyterHub Endpoint" \
	&& $(MAKE) get-jupyter-ip

get-jupyter-ip:
	kubectl get svc proxy-public -o jsonpath="{.status.loadBalancer.ingress[0].ip}" && echo "\n"

delete-cluster: 
	cd ./terraform/ && terraform destroy -auto-approve

clean-tfstate:
	cd ./terraform/ && rm terraform.tfstate terraform.tfstate.backup

test-echo:
	echo "testing 123" && echo "here" && kubectl get svc proxy-public -o jsonpath="{.status.loadBalancer.ingress[0].ip}" && echo 