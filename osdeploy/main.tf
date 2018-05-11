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


