#####################################################################
##
##      Created 5/8/18 by ucdpadmin. for osdeploy
##
#####################################################################

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
  key_pair  = "${var.openstack_keypair_name}"
  network {
    name = "Public_Service" 
    }
  availability_zone = "manage-az"
  security_groups = ["67854e08-d7ba-42f0-b253-5b81d92c6a2b"]
}
#

