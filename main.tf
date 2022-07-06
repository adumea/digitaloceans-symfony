terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_app" "digitaloceans-symfonys" {
  spec {
    name   = "digitaloceans-symfonys"
    region = "ams"

    service {
      name               = "digitaloceans-symfonys"
      environment_slug   = "php"
      instance_count     = 1
      instance_size_slug = "professional-xs"

      github {
        branch         = "master"
        deploy_on_push = true
        repo           = "adumea/digitaloceans-symfony"
      }
    }
  }
}