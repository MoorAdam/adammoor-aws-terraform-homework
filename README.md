## Description
This is a simple Terraform project, submitted as homework for my interview

## Project structure
The project starts with a `main.tf` root file, where the bigger resources are defined. For configuration, there is the `variables.tf` file for main configurations. We also have a providers file, which stores allt the providers' configurations (currently its just aws)

All the used modules are in the `modules` folder. Every modul has its own folder with a `main.tf` file, which defines the necessary resource for the modul, and a `variables.tf` file for configuration.All modules have been created by me.
There are two modules in this project. 
- **cloudfront distribution:** creates all the necessary configs for a simple html file distributer
- **static_file_server:** It uses an input path to a file, which gets uploaded a freshly deployed s3 bucket. It also deploys a cloudfront distribution, and gives it access to the s3 bucket

## Installation
This project supports centralized state management. For the sake of simplicty, the s3 bucket used for this project will be set up by a smaller terraform modul. 

If you dont want to have the centralized backend, remove or comment out the `backend` block from the root `main.tf` file

You will need aws cli with a profile that has the right permissions for creating resources.

**Before running the main project in the *"terraform"* folder, step inside the *"state-backend-setup"* folder with `cd state-backend-setup` and run `terraform init` then `terraform apply` inside the  folder. When the prompt asks if you wanna proceede, type in `yes`. This will set up the required s3 bucket for the backend.**

When its completed, you can run the main project.

**From the root directory, setp into the *"terraform"* folder with `cd terraform` and run `terraform init` then `terraform apply`. When the terminal asks if you wanna proceede, again, type in `yes`. This will start building the project. This will take several minutes. After the process completed with no errors, the project has been built**

## Created resources
This project has several resources. This s a lost for all created resources
- one vpc
- s3 bucket for state management.
- s3 bucket for serving the html file
- an ec2 instance inside the public subnet
- a public and a private subnet
- a cloudfront distribution
- an origin access control for accessing the s3 bucket for the state

## Destroying the project

To remove the created resources, you first need to destroy the main terraform project.
**Use the `cd terraform` command in the root folder, then use the `terraform destroy` command. This will remove all resources.**
**When the process is complete, use the `cd state-backend-setup` from the root folder, then use `terraform destroy` again to remove the backend.**

**Please note that this will remove the state file! If you want to restarted the project, you need to delete the ***".terraform"*** folder in the ***"terraform"*** folder, and use `terraform init` to reinitalize the project!**