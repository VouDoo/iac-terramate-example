// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "aws_vpc" "default" {
  default = true
}
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
resource "random_id" "unique_id" {
  byte_length = 8
}
locals {
  instance_name = "foo-${random_id.unique_id.hex}"
}
resource "aws_key_pair" "this" {
  key_name   = "${local.instance_name}-pubkey"
  public_key = "ssh-ed25519 YOLO"
}
module "instance" {
  allow_ssh = true
  extra_tags = {
    managed_by = "terraform"
  }
  groups = [
    "foo",
  ]
  key_name  = aws_key_pair.this.key_name
  name      = local.instance_name
  source    = "../../_remote/terraform/modules/ubuntu_instance"
  subnet_id = data.aws_subnet_ids.default.ids[0]
}
