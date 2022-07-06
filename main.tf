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

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${{ secrets.DO_TOKEN }}"
}


resource "digitalocean_app" "digitaloceans-symfony" {
  spec {
    name   = "digitaloceans-symfony"
    region = "ams"

    service {
      name               = "digitaloceans-symfony"
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