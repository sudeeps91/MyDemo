variable "vm_names" {
  type = list (string)
  default = ["ansible","master","node1","node2"]
}

variable "ami" {
  type = string
  default = "ami-020db2c14939a8efb"
}

variable "instance_type" {
  type = string
  default = "t2.medium"
}

variable "private_key_path" {
  type = string
  default = "/root/infrastructure/ssh-key.pem"
}
