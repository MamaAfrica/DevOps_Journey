resource "opc_compute_ip_network" "test" {
  name                = "internal-network"
  description         = "Terraform Provisioned Internal Network"
  ip_address_prefix   = "10.0.1.0/24"
  public_napt_enabled = false
}

resource "opc_compute_storage_volume" "test" {
  name = "internal"
  size = 100
}

resource "opc_compute_instance" "test" {
  name       = "terraformVM"
  label      = "Terraform Provisioned Instance"
  shape      = "oc3"
  image_list = "/oracle/public/oel_6.7_apaas_16.4.5_1610211300"

  storage {
    volume = "${opc_compute_storage_volume.test.name}"
    index  = 1
  }

  networking_info {
    index          = 0
    nat            = ["ippool:/oracle/public/ippool"]
    shared_network = true
  }
}