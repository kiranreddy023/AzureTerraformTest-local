#
# Local Provider by hashicorp
#
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "local" {
  # Configuration options
}

provider "random" {
  # Configuration options
}
