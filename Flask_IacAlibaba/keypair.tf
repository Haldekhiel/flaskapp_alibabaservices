resource "alicloud_ecs_key_pair" "keypairtest" {
  key_pair_name = "keypairtest"
  key_file      = "keypairtest.pem"

}
