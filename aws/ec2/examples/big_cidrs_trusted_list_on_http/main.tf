provider "aws" {
  region = "us-west-2"
}

data "aws_vpc" "default" {
  default = true
}

module "instance" {
  source = "../.."

  vpc_id = data.aws_vpc.default.id

  resources_prefix  = "test-instance"
  ssh_trusted_cidrs = ["0.0.0.0/0"]
  http_trusted_cidrs = [
    "127.0.0.1/32",
    "127.0.1.1/32",
    "127.1.1.1/32"
  ]

  name                        = "test-instance"
  type                        = "t2.micro"
  associate_public_ip_address = true
  root_volume_size            = 20
  root_volume_type            = "gp2"

  tags = {
    Environment = "Testing"
  }

  ami_filter = {
    owner = "amazon"
    name  = "amzn2-ami-hvm-2.0.20211001.1-x86_64-gp2"
  }
}

output "this" {
  value = module.instance
}
