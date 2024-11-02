resource "alicloud_db_instance" "mysql_test" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  instance_type            = "mysql.n2.medium.1"
  instance_storage         = 20
  instance_charge_type     = "Postpaid"
  instance_name            = "mysql_test"
  vswitch_id               = alicloud_vswitch.private-a.id
  db_instance_storage_type = "cloud_essd"
  security_group_ids       = [alicloud_security_group.mysql_sg_test.id]
  security_ips = [
    alicloud_vswitch.private-a.cidr_block
  ]
}

resource "alicloud_db_database" "mydatabase" {
  instance_id = alicloud_db_instance.mysql_test.id
  name        = var.db_name
}

resource "alicloud_rds_account" "mysql_user1" {
  db_instance_id   = alicloud_db_instance.mysql_test.id
  account_name     = var.db_user
  account_password = var.db_password
}

resource "alicloud_db_account_privilege" "privilege" {
  instance_id  = alicloud_db_instance.mysql_test.id
  account_name = alicloud_rds_account.mysql_user1.name
  privilege    = "ReadWrite"
  db_names     = [alicloud_db_database.mydatabase.name]
}
output "mysql_private_endpoint" {
  value = alicloud_db_instance.mysql_test.connection_string
}
