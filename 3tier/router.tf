resource "openstack_networking_router_v2" "application_router" {
  name = "application_router"
  admin_state_up = "true"
  external_gateway = "${var.external_gateway}"
}

resource "openstack_networking_router_interface_v2" "db_router_interface" {
  router_id = "${openstack_networking_router_v2.application_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.db_subnet.id}"
}
resource "openstack_networking_router_interface_v2" "app_router_interface" {
  router_id = "${openstack_networking_router_v2.application_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.app_subnet.id}"
}
resource "openstack_networking_router_interface_v2" "web_router_interface" {
  router_id = "${openstack_networking_router_v2.application_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.web_subnet.id}"
}




