########## variables for main.tf ##########

variable "name" {
  description 	= "The name for your EC2 security group"
  default 	= "enter_a_name_for_EC2_security_group"
}

variable "key_name" {
  description 	= "The name for the AWS_key_pair"
  default 	= "enter_a_name_for_AWS_key_pair"
}

variable "image_id" {
  description 	= "The ami image id"
  default     	= "ami-0f158b0f26f18e619"
}

#The default value must be in one single string with no spaces

variable "token_id" {
  description 	= "Sumo Logic Installation Token"
  default 	= "your_sumologic_token_id"
}

