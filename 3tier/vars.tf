variable "image" {
    default = "ubuntu-14.04-server-amd64"
}

variable "flavor" {
    default = "m1.small"
}

variable "app_key_file" {
    default = "~/.ssh/id_rsa"
}

variable "web_key_file" {
    default = "~/.ssh/id_rsa"
}

variable "dba_key_file" {
    default = "~/.ssh/id_rsa"
}

variable "ssh_user_name" {
    default = "ubuntu"
}

variable "external_gateway" {
   default = "e8b5c267-7c37-4222-8a89-d91ebb80526c"
}

variable "pool" {
    default = "ext-net"
}
