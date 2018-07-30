resource "aws_key_pair" "deployer" {
  key_name = "deploy"
  public_key = "${file("terraform_aws_key.pub")}"
}