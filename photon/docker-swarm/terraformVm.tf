provider "photon" {
    photon_target = "${var.PC_TARGET}"
    user = "${var.USER}"
    password = "${var.PASSWORD}"
    allow_unverified_ssl = "${var.TRUST_SSL_CERT}"
}

data "photon_tenant" "tenant" {
    name = "${var.TENANT_NAME}"
}

data "photon_project" "project" {
    tenant = "${data.photon_tenant.tenant.id}"
    name = "${var.PROJECT_NAME}"
}

data "photon_image" "vm_image" {
    name ="${var.VM_IMAGE_NAME}"
}

data "photon_network" "vm_network" {
    name = "${var.NETWORK_NAME}"
}

resource "photon_virtual_machine" "docker_data_center" {

    project = "${data.photon_project.project.id}"
    name="${var.VM_NAME}"
    flavor = "${var.VM_FLAVOR_NAME}"
    sourceImageId = "${data.photon_image.vm_image.id}"
    subnets = [ { id = "${data.photon_network.vm_network.id}"} ]
    ephemeralDisks = [
        {
            name = "boot-disk"
            kind = "ephemeral-disk"
            flavorName = "${var.EPHEMERAL_DISK_FLAVOR_NAME}"
            bootDisk = true
        }
    ]

    count = "${var.COUNT}"

    state = "STARTED"

    provisioner "remote-exec" {

        inline = [
            "${var.DOCKER_SWARM_TOKEN}"
        ]

        connection {
            type     = "ssh"
            user     = "${var.VM_USER}"
            password = "${var.VM_USER_PWD}"
        }
    }

}

output "vm_id" {
  value = "${photon_virtual_machine.docker_data_center.id}"
}

output "vm_ip" {
  value = "${photon_virtual_machine.docker_data_center.ipAddress}"
}
