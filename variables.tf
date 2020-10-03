##########
###AWS####
##########


variable "name" {
  description 	= "The name for your EC2 security group"
  default 	= "test"
}

variable "key_name" {
  description 	= "The name for the AWS_key_pair"
  default 	= "htestkey"
}

variable "image_id" {
  description 	= "The ami image id"
  default     	= "ami-0f158b0f26f18e619"
}


