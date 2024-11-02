resource "alicloud_security_group" "http_sg_test" {
  name   = "http_sg_test"
  vpc_id = alicloud_vpc.vpctest.id
}
resource "alicloud_security_group_rule" "http_sg_allow_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.http_sg_test.id
  cidr_ip           = "0.0.0.0/0"
}
resource "alicloud_security_group_rule" "http_sg_allow_flask" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "5000/5000"
  priority          = 1
  security_group_id = alicloud_security_group.http_sg_test.id
  cidr_ip           = "0.0.0.0/0"
}
