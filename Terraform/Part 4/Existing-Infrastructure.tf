data "vsphere_datacenter" "dc" {
}

data "vsphere_datastore" "datastore" {
  name          = "School Library"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Hogwarts School Houses"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "dumbledores army"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "Gryffindor"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name          = "Marauders Map"
  datacenter_id = data.vsphere_datacenter.dc.id
}
