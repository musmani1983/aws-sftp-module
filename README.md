# AWS SFTP Module


Code a solution for:
AWS Transfer Family Terraform module
Create from scratch SFTP/AWS Transfer terraform module and use example terraform.tfvars as an input variables.
Module should create following:

• AWS Transfer family SFTP service

• Authentication lambda

• IAM roles and policies

• S3 buckets

• Users


AWS Transfer family SFTP service
Service should be created supporting following:
• SFTP protocol

• AWS_LAMBDA identity provider

**Authentication lambda**

User authentication should be handled by a lambda function, and it should support:
• Password authentication
• SSH public key authentication (if PublicKey property is present)
• IP whitelisting
Following terraform module can be used to build and deploy lambda

**IAM roles and policies**
Each user should have its own role with policy attached. The following is assumed:
• Read Only role (if ReadOnly property is present)
• Read/Write
• Roles should allow an access only to user home dir (users shouldn't see each other home dirs)

**S3 buckets**

Module should:
• Create S3 bucket as user home directory
• Allow using existing S3 bucket as a home directory (if property CreateBucket is false)

**Users**

Module should allow creating multiple users. Each user can have the following properties:
• User should have secure password created (string)
• HomeDirectory - S3 bucket location (string)
• CreateBucket - Whether create S3 bucket (string)
• AllowFrom - List of IP addresses that user is allowed to connect from (list)
• PublicKey - SSH Public key (string)
• ReadOnly - User can only read files (bool)
• Tags - Tags (map)

```
provider "aws" {
  region = "eu-west-2"
}

module "sftp" {
  source = "./modules/sftp"

  name = "nep-interview-sftp"
  users = {
    user1 = {
      HomeDirectory = "/nep-interview-user1-bucket/"
      PublicKey     = "ssh-rsa public-key"
      AllowFrom     = ["0.0.0.0"]
      Tags = {
        Name         = "Test user1"
        Organisation = "NEP"
      }
    }
    user2 = {
      HomeDirectory = "/nep-interview-user2-bucket/"
      PublicKey     = "ssh-rsa public-key"
      AllowFrom     = ["0.0.0.0"]
      ReadOnly      = true
    }
  }

}
```