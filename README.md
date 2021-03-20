# Final Project DevOps Course

This is project, which was made on the basis provided certification task, which checks knowledge received as a result of training on the DevOps course.
Below you cas see sample screenshot from Jenkins pipeline results.

![final-project_overview](https://user-images.githubusercontent.com/43615585/111874332-d587fb80-89a5-11eb-9e4a-7d9606238934.png)

### What was the task?

Write Jenkins pipeline, which launch instances in AWS, build Java application and deploy application on stage. Nessesary to use Terraform code and Ansible. Application have to be published in container.  

### Credentials

To run this project you should create following variables in Jenkins

![credentials_jenkins](https://user-images.githubusercontent.com/43615585/111871585-0a8f5080-899c-11eb-8e5e-8b803ad8af08.png)

### Project structure

There are you can see the structure of project, with short description.

    .
    ├── ansible
    │   ├── provisoning.yml          # Provisoning ansible playbook
    ├── docker                       # Directory for Dockerfiles
    │   ├── jenkins-agent            # Directory for jenkins-agent Dockerfile
    │   │   ├── Dockerfile           # Dockerfile to create jenkins-agent for jenkins pipeline
    │   ├── maven                    # Directory for maven Dockerfile
    │   │   ├── Dockerfile           # Dockerfile to create maven container
    │   ├── tomcat                   # Directory for tomcat Dockerfile
    │   │   ├── Dockerfile           # Dockerfile to create tomcat container   
    ├── jenkins                      # Directory for Jenkinsfile   
    │   ├── Jenkinsfile              # Jenkins file with pipeline commands
    ├── terraform                    # Directory for Terraform
    │   ├── instances.tf             # File instances.tf describes resources, which will created on AWS: maven, tomcat hosts and etc
    │   ├── inventory.tmpl           # File inventory.tmpl is used for generating inventory file for Ansible 
    │   ├── outputs.tf               # File outputs.tf is used to create inventory file for Ansible after terraform resources will created
    │   ├── terraform.tfvars         # File terraform.tfvars contains necessary variables for Terraform
    │   ├── variables.tf             # File variables.tf contains variables for Terraform 
    ├── log                          # Log directory which contains result of example successful pipeline job 
    │    ├── jenkins-job.log         # File jenkins-job.log contains result of pipeline job 
    ├── README.md                    # Description of the project
    └── .gitignore                   # File, which ignored unnecessary
