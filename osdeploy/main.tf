#####################################################################
##
##      Created 5/8/18 by ucdpadmin. for osdeploy
##
#####################################################################

## REFERENCE {"network1":{"type": "openstack_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}


provider "openstack" {
  user_name   = "${var.openstack_user_name}"
  password    = "${var.openstack_password}"
  tenant_name = "${var.openstack_project_name}"
  domain_name = "${var.openstack_domain_name}"
  auth_url    = "${var.openstack_auth_url}"
  region      = "${var.openstack_region}"
  insecure    = true
  version = "~> 1.2"
}

resource "openstack_compute_instance_v2" "LinuxVM" {
  name      = "${var.LinuxVM_name}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair  = "${openstack_compute_keypair_v2.auth.id}"
  network {
    uuid = "${var.openstack_network1_id}"
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "openstack_compute_keypair_v2" "auth" {
    name = "openstack-temp-public-key"
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}

