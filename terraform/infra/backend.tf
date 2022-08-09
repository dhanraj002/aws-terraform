terraform {
  backend "s3" {
    bucket               = "cloudtech-terraform-resource-states"
    workspace_key_prefix = "Tenant/cloudtech"
    key                  = "terraform.tfstate"
    region               = "us-east-2"
  }
}