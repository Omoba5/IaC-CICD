# Documentation of Infrastructure as Code CI/CD using Gitlab-CI, Terraform and Ansible

## Pre-requisites
You will need to create a Google Cloud Platform Service Account and get its credentials in json format and also create a Gitlab Personal Access Token. To create a GCP service account follow these [steps](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#set-up-gcp). To create a personal access token on Gitlab follow these [steps](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token). Save the GCP Service account credential as a variable named `CREDENTIAL` as a **file** and the Gitlab Personal Access Token as a variable named `GITLAB_ACCESS_TOKEN`.

## Objective:

To create a configurable CI/CD pipeline that will provision Infrastructure written as Terraform and Ansible code. This project can be easily modified to provision any infrastructure on Microsoft Azure. In this project, you will find terraform code that provisions 3 VMs in 3 environments using Terraform and configures these 3 VMs using Ansible.

## Aim: 

The aim of this project is to implement a Pipeline that automatically provisions and configures environments through a merge-request to master and destroys the provisioned infrastructure by the click of a run button.

---

### List of Files

```
terraform
  ├── dev
  │     ├── provider.tf
  │     ├── main.tf
  │     └── backend.tf
  ├── staging
  │     ├── provider.tf
  │     ├── main.tf
  │     └──	backend.tf
  ├── prod
  │     ├── provider.tf
  │     ├── main.tf
  │     └── backend.tf
  ├── README.md
  ├── .gitlab-ci.yml
  ├── ansible_files
  │     ├── install_nginx.yml
  │     └── ansible.cfg
  ├── vm_ips
  │     └── vm_ip1.txt*
  └── modules
        └── ubuntu_vm
              ├── main.tf
              └── variables.tf
```
Note: Files with the **`*`** are not in the repository until terraform has provisioned the VMs along with their IP addresses. `dev`, `staging` and `prod` folders represent 3 environments. What differentiates them is the **environment** variable in the `terraform/(*dev*|*staging*|*prod*)/main.tf` file.