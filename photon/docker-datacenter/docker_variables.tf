variable "PC_TARGET" {
  type    = "string"
  description = "photon controller api url"
}

variable "USER" {
   type    = "string"
}

variable "PASSWORD" {
   type    = "string"
}

variable "TRUST_SSL_CERT" {
   type    = "string"
   description ="whether to trust ssl cert presented by server"
}

variable "TENANT_NAME" {
   type    = "string"
   description ="name of the tenant"
}

variable "EPHEMERAL_DISK_FLAVOR_NAME" {
   type    = "string"
   description = "name of flavor for ephemeral disk"
}

variable "VM_FLAVOR_NAME" {
   type    = "string"
   description = "name of flavor for vm"
}

variable "VM_IMAGE_NAME" {
   type    = "string"
   description = "name of vm image to use for vm"
}

variable "NETWORK_NAME" {
   type    = "string"
   description = "name of netwoek to use for vm"
}

variable "PROJECT_NAME" {
   type    = "string"
   description = "name of project 1 in first tenant"
}

variable "VM_NAME" {
   type    = "string"
   description = "name of the VM"
}


variable "VM_USER" {
   type    = "string"
   description = "name of the user used for provisioning vm"
}


variable "VM_USER_PWD" {
   type    = "string"
   description = "pwd of the user used for provisioning vm"
}

variable "DOCKER_USER" {
   type    = "string"
   description = "name of the user used for provisioning vm"
}


variable "DOCKER_USER_PWD" {
   type    = "string"
   description = "pwd of the user used for provisioning vm"
}


variable "COUNT" {
   type    = "string"
   description ="number of swarm workers"
}
