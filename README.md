# jupyter-on-gke
Attempt to run JupyterHb on GKE
> The `make` commands are used to make things simpler but manually running terraform and getting the IP from kubectl would do the same 

Setup `gcloud` if you have not to point at your project

Make sure that you have the following installed:
* Terraform
* \<Dependency here\>

## Installation

Note: Terraform keeps state metadata in a local file called `terraform.tfstate`.
If you need to reinstall any resources, make sure to delete this file as well.

### Start JupyterHub with Standard Cluster

1. Run `make init-terraform`

2. Run `make create-cluster PROJECT=<project-name-here>`

3. Go to the IP address printed out at the end of the build

### Start JupyterHub with Autopilot 

1. Run `make init-terraform`

2. Run `make create-cluster PROJECT=<project-name-here> AUTOPILOT=true`

3. Go to the IP address printed out at the end of the build

### Variables 

