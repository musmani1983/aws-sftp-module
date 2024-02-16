provider "aws" {
  region = "eu-west-2"
}

module "sftp" {
  source = "./modules/sftp"

  name = "nep-interview-sftp"
  users = {
    user1 = {
      HomeDirectory = "/nep-interview-usmani-bucket1/"
      PublicKey     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpLSsTn4XMjeP5HzNP5ndCaYXyUCMD1VQPB4bLbB9QOwh/1xgEyusgCUqutJQpu1nhg4EPMfAxaeUsYskot6qomSFk79/SSebTrKEIQPrw0cZ8dHEp6hkfxGl+t9Cawdh8w1AYqi1yQndvi5xy4QUtx/QyjaCbG1Xazk0jhKSaWFzfHnLRRQ+5r0KMqTezAuiX+kEuePniQZjexWo97Eqs+yz7CKLmv3/xv+JPPe/Sa3gUB+cRKSvxWAUDLOjMnvGjQA5rKPrq7iQjh3BKTy6rPO95EYCJnPYXO0CbZ1Sgm1GqlysO3ecB0yhNYk0XGMNz0gNxNVQLcdnBXHyeHNfr mac@usmani"
      AllowFrom     = ["0.0.0.0"]
      Tags = {
        Name         = "Test user1"
        Organisation = "NEP"
      }
    }
    user2 = {
      HomeDirectory = "/nep-interview-shared-bucket/"
      PublicKey     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8MTIEIHOwjpQrgarMnsd+YfF40uH8RF84lRygNpxbYnqT8aRqig6H2eGzdSi+yXOZueHndB5mAu14o7Bf7L1x5B0TKvHdwor7Anz2hfzdBp+PFzoL0qwYl52MgZtQmLSyLJ3Fafu3HDck9unGFQZQ91+rQM+zjJx8O+xhrto8uRPAMf8CNlCztmbzN12eR7QjXslMSBaeiUzwQyCRALSAQ+UIw2JFO9DWMVYYjyZ6L5ewV4SwxY87HVaEm/cAmQlD2ldG8IOGjeHf+G0iuHsA756A+N1N+w2adot6jWjtCP8xp7JQhtAihocRfnEP5euuRl8u+8G7VC51E8oJmJ0p laptop@usmani"
      AllowFrom     = ["0.0.0.0"]
      ReadOnly      = true
    }
  }

}