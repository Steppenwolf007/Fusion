#####################################################################
##
##      Created 5/8/18 by ucdpadmin. for osdeploy
##
#####################################################################

output "Assigned IPV4" {
value = "${openstack_compute_instance_v2.LinuxVM.access_ip_v4}"
}