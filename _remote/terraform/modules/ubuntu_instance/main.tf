resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group dedicated to ${var.name} instance"
  vpc_id      = data.aws_vpc.selected.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  count = var.allow_ssh ? 1 : 0

  description       = "Allow SSH port"
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.this.id
  ]

  tags = merge(var.extra_tags, {
    Name             = var.name
    ec2_default_user = "ubuntu"
    groups           = join(",", var.groups)
  })
}
