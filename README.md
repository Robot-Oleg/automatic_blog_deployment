## Automation script using terraform to deploy my server on AWS


### to use script for your needs:
- create terraform.tfvars file
- add 2 variables access_role and ecr_image
```
access_role = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
ecr_image = "<private-ecr-url>/<repo-name>:<image-tag>"
```