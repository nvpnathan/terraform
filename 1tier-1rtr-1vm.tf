provider "openstack" {
        insecure = true
}

resource "openstack_networking_network_v2" "network_terraform" {
  name = "network_terraform"
  admin_state_up = "true"
}

resource "openstack_networking_router_v2" "router_terraform" {
  region = "nova"
  name = "router_terraform"
  external_gateway = "e8b5c267-7c37-4222-8a89-d91ebb80526c"
}

resource "openstack_networking_subnet_v2" "subnet_terraform" {
  name = "subnet_terraform"
  network_id = "${openstack_networking_network_v2.network_terraform.id}"
  cidr = "192.168.199.0/24"
  ip_version = 4
  enable_dhcp = true
  dns_nameservers = ["10.132.71.1"]
}


resource "openstack_networking_router_interface_v2" "router_interface_terraform" {
  region = "nova"
  router_id = "${openstack_networking_router_v2.router_terraform.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_terraform.id}"
}

resource "openstack_compute_secgroup_v2" "secgroup_terraform" {
  name = "secgroup_terraform"
  description = "a security group"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_networking_port_v2" "port_terraform" {
  name = "port_terraform"
  network_id = "${openstack_networking_network_v2.network_terraform.id}"
  admin_state_up = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.secgroup_terraform.id}"]

  fixed_ip {
      "subnet_id" =  "${openstack_networking_subnet_v2.subnet_terraform.id}"
  }
}

resource "openstack_networking_floatingip_v2" "floatip_terraform" {
  region = "nova"
  pool = "ext-net"
  port_id = "${openstack_networking_port_v2.port_terraform.id}"
}

resource "openstack_compute_instance_v2" "instance_terraform" {
  name = "instance_terraform"
  image_id = "ea6a36cb-cd90-4709-8e04-d72c590d6bf0"
  flavor_id = "2"
  network {
    port = "${openstack_networking_port_v2.port_terraform.id}"
  }
}

