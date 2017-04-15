resource "photon_virtual_machine" "docker_worker" {

    project = "${data.photon_project.project.id}"
    #name="${var.WORKER_VM_NAME}"
    name="docker-worker-${count.index}"
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
	    "sshpass -p nsxr0cks! scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@${photon_virtual_machine.docker_manager.ipAddress}:~/swarm.token .;sh -e swar*"
        ]

        connection {
            type     = "ssh"
            user     = "${var.VM_USER}"
            password = "${var.VM_USER_PWD}"
        }
    }

}

output "worker_vm_id" {
  value = "${photon_virtual_machine.docker_worker.id}"
}

output "worker_vm_ip" {
  value = "${photon_virtual_machine.docker_worker.ipAddress}"
}
