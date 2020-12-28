# 3 Tier Application

A 3-tier application architecture consists of a presentation tier, an application tier and a data tier. To create a 3 Tier application I have create the below  layers/subnets.

The first layer is the **public layer** , which will host an internet-facing Elastic Load Balancer (ELB),which is the entry point for the application.This ELB is accessible via Internet Gateway.

The next layer is the **private** presentation or the web tier.This is created in the private subnet. Here the EC2 servers are deployed with AutoScale Group to scale up or down as needed.The web layer is only accessible from the public ELB.

After this is the application tier created in **private** subnet. This is also deployed with AutoScale Group to scale up or down as needed.The application layer is accessible only from the Internal Load balancer.

Last layer is the Database layer which is RDS(postgres).This is also in the **private** subnet. The only way to access the database is by connecting to it from the application layer.

![Alt text](diagram/3TierApp.jpg?raw=true "3 Tier Application")

## Requirements

* Terraform >= 0.14.0
* Export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as environment variables to allow creation of AWS resources..
* S3 Bucket with the name `threetier-tfstate` to store the tfstate.
* Key Pair `westkey`.

***Note:*** 
1. S3 name for backend configuration is passed from backend_stage.conf file via CLI.
2. Key pair can be configured in `terraform.tfvars` file.

## Usage

Clone this repository and create a copy of the file secret.tfvars.tpl with name secret.tfvars to pass the DB password.

Change to terraform directory.
```
cd terraform
```

### Initializing Terraform:
Initialize the terraform by passing the backend configurations.

```Terraform
terraform init -backend-config=backend_stage.conf
```

### Terraform Plan
Create the plan by passing the tfvars file.
```Terraform
terraform plan -var-file=terraform.tfvars -var-file=secret.tfvars
```

### Terraform Apply
Execute the plan by passing the tfvars file.
```Terraform
terraform apply -var-file=terraform.tfvars -var-file=secret.tfvars
```

### Terraform Destroy
To destroy the created resource execute the deleted command.
```Terraform
terraform destroy -var-file=secret.tfvars
```
