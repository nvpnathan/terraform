provider "openstack" {
        insecure = true
}
resource "openstack_compute_instance_v2" "web_server" {
  name = "web_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.app_key_pair.name}"
  network {
    port = "${openstack_networking_port_v2.port_web_server.id}"
  }
}

resource "openstack_compute_instance_v2" "app_server" {
  name = "app_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.app_key_pair.name}"
  security_groups = [ "${openstack_compute_secgroup_v2.appsg.name}" ]
  network {
    port = "${openstack_networking_port_v2.port_app_server.id}"
  }
}

resource "openstack_compute_instance_v2" "dba_server" {
  name = "dba_server"
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.app_key_pair.name}"
  network {
    port = "${openstack_networking_port_v2.port_db_server.id}"
  }
}
