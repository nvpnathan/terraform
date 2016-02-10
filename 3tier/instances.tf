provider "openstack" {
        insecure = true
}
resource "openstack_compute_instance_v2" "web_server" {
  name = "web_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.web_key_pair.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.websg.name}" ]
  network {
    uuid = "${openstack_networking_network_v2.web_network.id}"
  }
}

resource "openstack_compute_instance_v2" "app_server" {
  name = "app_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.app_key_pair.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.appsg.name}" ]
  network {
    uuid = "${openstack_networking_network_v2.app_network.id}"
  }
}

resource "openstack_compute_instance_v2" "dba_server" {
  name = "dba_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.dba_key_pair.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.dbsg.name}" ]
  network {
    uuid = "${openstack_networking_network_v2.db_network.id}"
  }
}
