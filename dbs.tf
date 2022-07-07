module "db" {
  source  = "mohsenSy/db/digitalocean"
  version = "0.2.0"

  name = "sql-cluster"
  size = "db-s-1vcpu-1gb"
  engine = "mysql"
  db_version = "8"
  node_count = 1
  region = "fra1"

  users = ["adumea", "sander"]
  tags = ["sql", "fra1"]
}

output "host" {
  value = module.db.host
}

output "passwords" {
  sensitive = true
  value = module.db.passwords
}