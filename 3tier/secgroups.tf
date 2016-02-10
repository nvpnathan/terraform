resource "openstack_compute_secgroup_v2" "websg" {
  name = "websg"
  description = "Security group for the Web VMs"
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  } 
}

resource "openstack_compute_secgroup_v2" "appsg" {
  name = "appsg"
  description = "Security group for the App VMs"
  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "10.0.0.0/24"
  }
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "10.0.0.0/24"
  } 
}
resource "openstack_compute_secgroup_v2" "dbsg" {
  name = "dbsg"
  description = "Security group for the DB VMs"
  rule {
    from_port = -1
    to_port = -1
    ip_protocol = "icmp"
    cidr = "10.0.1.0/24"
  }
  rule {
    from_port = 1
    to_port = 65535
    ip_protocol = "tcp"
    cidr = "10.0.1.0/24"
  } 
}
