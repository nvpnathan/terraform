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
  external_gateway = "cd1b3ee4-9278-43ed-8c74-96c00a2fe991"
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
  pool = "Ext-VMwareInterconnect"
  port_id = "${openstack_networking_port_v2.port_terraform.id}"
}

resource "openstack_compute_instance_v2" "instance_terraform" {
  name = "instance_terraform"
  image_id = "8ac317da-0714-4a45-828e-9099112038db"
  flavor_id = "38964450-0670-4d44-82db-90d64d6cbea9"
  network {
    port = "${openstack_networking_port_v2.port_terraform.id}"
  }
}

