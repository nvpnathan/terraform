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
   default = "fdb92e61-75e4-47ef-9b74-557af5b6147d"
}

variable "pool" {
    default = "ext-net"
}
