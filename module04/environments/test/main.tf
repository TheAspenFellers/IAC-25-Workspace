module "stacks" {
  source = "../../stacks"
  
  name            = var.name
  location        = var.location
  subsciption_id  = var.subsciption_id
  tags            = var.tags
  env             = var.env
  vnet_cidr       = var.vnet_cidr
  snet_cidr       = var.snet_cidr
  vm_size         = var.vm_size
  ssh_public_key_path = var.ssh_public_key_path
  enable_public_ip = var.enable_public_ip
  admin_username  = var.admin_username
}