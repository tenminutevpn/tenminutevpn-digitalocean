terraform {
  backend "s3" {
    bucket = "andreygubarev"
    key    = "terraform.tfstate"

    endpoint = "https://s3.us-east-005.backblazeb2.com"
    region   = "us-east-005"
    encrypt  = false

    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}

module "tenminutevpn" {
  source  = "tenminutevpn/tenminutevpn/digitalocean"
  version = "0.1.7"

  tenminutevpn_region  = "fra1"
  tenminutevpn_version = "v0.1.7"
}

output "wireguard" {
  value     = module.tenminutevpn.wireguard
  sensitive = true
}
