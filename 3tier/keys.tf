resource "openstack_compute_keypair_v2" "app_key_pair" {
  name = "app_key"
  public_key = "${file("${var.app_key_file}.pub")}"
}

resource "openstack_compute_keypair_v2" "dba_key_pair" {
  name = "db_key"
  public_key = "${file("${var.dba_key_file}.pub")}"
}

resource "openstack_compute_keypair_v2" "web_key_pair" {
  name = "web_key"
  public_key = "${file("${var.web_key_file}.pub")}"
}

