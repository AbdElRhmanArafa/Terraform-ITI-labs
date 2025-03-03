resource "aws_instance" "main" {
  for_each      = { for ec2 in var.ec2_config : ec2.name => ec2 }
  ami           = local.ami_mapping[each.value.ami]
  instance_type = each.value.instance_type
  key_name      = each.value.key_name
  subnet_id     = module.network.subnets_list[each.value.subnet_name].id
  tags = {
    Name = each.value.name
  }

}

locals {
  ami_mapping = {
    "ubuntu" = data.aws_ami.ubuntu.id
  }
}

