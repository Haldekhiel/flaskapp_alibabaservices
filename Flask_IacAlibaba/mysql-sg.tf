resource "alicloud_security_group" "mysql_sg_test" {
  name   = "mysql_sg_test"
  vpc_id = alicloud_vpc.vpctest.id
}

resource "alicloud_security_group_rule" "allow_mysql_access" {
  type                     = "ingress"
  ip_protocol              = "tcp"
  policy                   = "accept"
  port_range               = "3306/3306"
  priority                 = 1
  security_group_id        = alicloud_security_group.mysql_sg_test.id
  source_security_group_id = alicloud_security_group.http_sg_test.id
}
