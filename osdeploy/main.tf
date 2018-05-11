#####################################################################
##
##      Created 5/8/18 by ucdpadmin. for osdeploy
##
#####################################################################

terraform {
  required_version = "> 0.8.0"
}

provider "OpenStack" {
  insecure    = true
  version = "~> 1.2"
}


resource "openstack_compute_instance_v2" "nova" {
  name      = "${var.nova_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair  = "${openstack_compute_keypair_v2.auth.id}"
  network {
    uuid = "${var.openstack_os-network_id}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "openstack_compute_keypair_v2" "auth" {
    name = "openstack-temp-public-key"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

resource "openstack_networking_network_v2" "neutron-network" {
  name           = "neutron-network"
  admin_state_up = "true"
}