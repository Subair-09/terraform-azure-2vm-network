output "vm1_private_ip" {
  value = module.vm1.private_ip
}

output "vm2_private_ip" {
  value = module.vm2.private_ip
}

output "ping_instruction" {
  value = "VMs are in same subnet — they can ping using private IPs"
}





