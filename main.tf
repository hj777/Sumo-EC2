##################################################################
# Create EC2 and Install Sumo Logic Collector
##################################################################

##### AWS Region #####

provider "aws" {
  region = "ap-southeast-2"
}

##### AWS Key pair #####

resource "aws_key_pair" "htest-key" {
  key_name 	= "htest-key"
  public_key 	= file("pub.txt")
} 

##### AWS VPC #####

data "aws_vpc" "default" {
  default = true
}

##### AWS Subnet #####

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

##### AWS Security Group #####

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "my-ec2"
  description = "Security group for example usage with EC2 instance"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

##### Sumologic Installation file #####

data "template_file" "sumo_install" {
  template = file("sumo_install.yaml")
}

##### AWS EC2 Instance ##### 

resource "aws_instance" "my-ec2" {
  ami           		= "ami-0f158b0f26f18e619"
  instance_type 		= "t2.micro"
  key_name 			= aws_key_pair.htest-key.key_name
  depends_on                  	= [aws_key_pair.htest-key]
  associate_public_ip_address 	= true
  vpc_security_group_ids      	= ["${module.security_group.this_security_group_id}"] 
  user_data 			= data.template_file.sumo_install.rendered
}


   
