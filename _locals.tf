// Tags

locals {

  default_tags = {
    Project     = var.tag_project
    Environment = var.tag_environment
    Owner       = var.tag_owner
  }

}
