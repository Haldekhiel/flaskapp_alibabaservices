resource "alicloud_instance" "bastion" {
  availability_zone          = data.alicloud_zones.default.zones.0.id
  instance_name              = "bastion"
  instance_type              = "ecs.g6.large"
  image_id                   = "ubuntu_24_04_x64_20G_alibase_20240812.vhd"
  security_groups            = [alicloud_security_group.bastion_sg.id]
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_essd"
  vswitch_id                 = alicloud_vswitch.public-a.id
  key_name                   = alicloud_ecs_key_pair.keypairtest.key_pair_name
  internet_max_bandwidth_out = 10
}

output "bastion_public_ip" {
  value = alicloud_instance.bastion.public_ip
}
