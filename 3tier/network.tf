resource "openstack_networking_network_v2" "web_network"{
  name = "web_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "web_subnet" {
  name = "web_subnet"
  network_id = "${openstack_networking_network_v2.web_network.id}"
  cidr = "10.0.0.0/24"
  ip_version = 4
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}

resource "openstack_networking_network_v2" "app_network"{
  name = "app_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "app_subnet" {
  name = "app_subnet"
  network_id = "${openstack_networking_network_v2.app_network.id}"
  cidr = "10.0.1.0/24"
  ip_version = 4
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}

resource "openstack_networking_network_v2" "db_network"{
  name = "db_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "db_subnet" {
  name = "db_subnet"
  network_id = "${openstack_networking_network_v2.db_network.id}"
  cidr = "10.0.2.0/24"
  ip_version = 4
  dns_nameservers = ["8.8.8.8","8.8.4.4"]
}
