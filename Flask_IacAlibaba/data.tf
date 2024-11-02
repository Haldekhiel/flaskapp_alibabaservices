data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}
data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_kvstore_zones" "default" {
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id = data.alicloud_zones.default.zones.0.id
}

# output "first_kvstore_instance_class" {
#   value = data.alicloud_kvstore_instance_classes.default.instance_classes
# }
data "alicloud_db_instance_classes" "default" {
  engine               = "MySQL"
  engine_version       = "8.0"
  category             = "Basic"
  instance_charge_type = "PostPaid"
}

# output "alicloud_db_instance_classes" {
#   value = data.alicloud_db_instance_classes.default.instance_classes
# }
