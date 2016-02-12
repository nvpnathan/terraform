resource "openstack_networking_port_v2" "port_web_server" {
  name = "port_web_server"
  network_id = "${openstack_networking_network_v2.web_network.id}"
  admin_state_up = "true"
  security_group_ids = [ "${openstack_compute_secgroup_v2.websg.id}" ]
  fixed_ip {
      "subnet_id" =  "${openstack_networking_subnet_v2.web_subnet.id}"
  }
}

resource "openstack_networking_port_v2" "port_app_server" {
  name = "port_app_server"
  network_id = "${openstack_networking_network_v2.app_network.id}"
  admin_state_up = "true"
  security_group_ids = [ "${openstack_compute_secgroup_v2.appsg.id}" ]
  fixed_ip {
      "subnet_id" =  "${openstack_networking_subnet_v2.app_subnet.id}"
  }
}

resource "openstack_networking_port_v2" "port_db_server" {
  name = "port_db_server"
  network_id = "${openstack_networking_network_v2.db_network.id}"
  admin_state_up = "true"
  security_group_ids = [ "${openstack_compute_secgroup_v2.dbsg.id}" ]
  fixed_ip {
      "subnet_id" =  "${openstack_networking_subnet_v2.db_subnet.id}"
  }
}
