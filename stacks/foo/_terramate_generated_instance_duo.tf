// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_key_pair" "this" {
  key_name   = "foo-key"
  public_key = "ssh-ed25519 YOLO"
}
module "first_instance" {
  ansible_groups = [
    "foo",
  ]
  key_name = aws_key_pair.this.key_name
  name     = "foo-1"
  source   = "../../_remote/terraform/modules/ubuntu_instance"
}
module "second_instance" {
  ansible_groups = [
    "foo",
  ]
  key_name = aws_key_pair.this.key_name
  name     = "foo-2"
  source   = "../../_remote/terraform/modules/ubuntu_instance"
}
