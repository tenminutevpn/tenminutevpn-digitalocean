terraform {
  backend "local" {}
}

module "tenminutevpn" {
  source  = "github.com/tenminutevpn/terraform-digitalocean-tenminutevpn?ref=v0.1.4"

  tenminutevpn_region = "fra1"
  tenminutevpn_version = "v0.1.4"
}

output "wireguard" {
  value = module.tenminutevpn.wireguard
  sensitive = true
}
