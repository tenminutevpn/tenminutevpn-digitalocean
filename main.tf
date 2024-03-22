terraform {
  backend "local" {}
}

module "tenminutevpn" {
  source  = "tenminutevpn/tenminutevpn/digitalocean"
  version = "0.1.8-rc1"

  tenminutevpn_region  = "fra1"
  tenminutevpn_version = "v0.1.8"
}

output "wireguard" {
  value     = module.tenminutevpn.wireguard
  sensitive = true
}
