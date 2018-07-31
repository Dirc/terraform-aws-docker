variable "region" {
    default = "us-east-2"
}
variable "ami" {
    default = "ami-731c2016"
}
variable "private_key_path" {
    default = "terraform_aws_key.pem"
}
variable "public_key_path" {
    default = "terraform_aws_key.pub"
}
