resource "alicloud_kvstore_instance" "redistest" {
  db_instance_name  = "redistest"
  vswitch_id        = alicloud_vswitch.private-a.id
  zone_id           = data.alicloud_zones.default.zones.0.id
  instance_class    = "redis.master.small.default"
  instance_type     = "Redis"
  engine_version    = "5.0"
  security_group_id = alicloud_security_group.redis_sg_test.id
  payment_type      = "PostPaid"
  password          = var.redis_password
  security_ips = [
    alicloud_vswitch.private-a.cidr_block
  ]
}

output "redis_private_endpoint" {
  value = alicloud_kvstore_instance.redistest.connection_domain
}
