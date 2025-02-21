// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_key_pair" "this" {
  key_name   = "bar-key"
  public_key = "ssh-ed25519 YOLO"
}
module "instance" {
  ansible_groups = [
    "bar",
  ]
  key_name = aws_key_pair.this.key_name
  name     = "bar"
  source   = "../../_remote/terraform/modules/ubuntu_instance"
}
