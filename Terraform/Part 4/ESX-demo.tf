provider "vsphere" {
    user           = var.vsphere_user
    password       = var.vsphere_password
    vsphere_server = var.vsphere_server

    # If you have a self-signed cert
    allow_unverified_ssl = true
}

variable "vsphere_user" {
    type = string
    default = "harry.potter@hogwarts-witchcraf-wizardry.sch"
}
variable "vsphere_password" {
    type = string
    default = "isolemnlyswearthatiamuptonogood"

}
variable "vsphere_server" {
    type = string
    default "4 privet drive"
}

resource "vsphere_virtual_machine" "vm" {
    name              = "My-First-ESX-VM"
    resource_pool_id  = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id      = data.vsphere_datastore.datastore.id
    folder            = "Restricted Section"

    num_cpus = 2
    memory   = 4096
    guest_id = data.vsphere_virtual_machine.template.guest_id

    scsi_type = data.vsphere_virtual_machine.template.scsi_type
    firmware = data.vsphere_virtual_machine.template.firmware

    network_interface {
      network_id   = data.vsphere_network.network.id
      adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    }

    disk {
      label            = "disk0"
      size             = data.vsphere_virtual_machine.template.disks.0.size
      eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
      thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
      template_uuid = data.vsphere_virtual_machine.template.id
      
      customize {
            network_interface{}
            windows_options {
              computer_name  = "My-First-ESX-VM"
              workgroup      = "MyWorkGroup"
              admin_password = "P455w0rd!"
            }
      }
    }
}

