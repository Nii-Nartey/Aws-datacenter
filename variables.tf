

variable "vpc_cidr" {
    description = "vpc_cidr_block"
  default = "10.0.0.0/16"
}



variable "Subnet-cidr" {
    description = "Private subnet 1 cidr"
  default = "10.0.1.0/24"
}


variable "Region" {
    description = "Region of the resources"
  default = "eu-west-2"
}



variable "ami" {
    description = "ami-type"
  default = "ami-078a289ddf4b09ae0"
}

variable "instance" {
    description = "instance-type"
  default = "t2.micro"
}