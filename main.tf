terraform {
  backend "local" {}
}

module "tenminutevpn" {
  source  = "tenminutevpn/tenminutevpn/digitalocean"
  version = "0.1.10"

  tenminutevpn_region  = "fra1"
  tenminutevpn_version = "v0.1.10"

  wireguard_port = 51820
}

output "wireguard" {
  value     = module.tenminutevpn.wireguard
  sensitive = true
}

output "ipv4_address" {
  value = module.tenminutevpn.ipv4_address
}

output "ssh_private_key" {
  value     = module.tenminutevpn.ssh_private_key
  sensitive = true
}
