/* Setup our aws provider */
provider "aws" {
  region      = "${var.region}"
}
resource "aws_instance" "master" {
  ami           = "${var.ami}"
  instance_type = "m5.large"
//  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.swarm.name}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  connection {
    user = "ubuntu"
    private_key = "${file("terraform_aws_key.pem")}"
  }
  provisioner "remote-exec" {
    scripts = [
      "scripts/install_docker.sh",
//      "scripts/swarm_manager.sh"
    ]
  }
  tags = {
    Name = "swarm-master"
  }
}

resource "aws_instance" "slave" {
  count         = 0
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.swarm.name}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  connection {
    user = "ubuntu"
    private_key = "${file("terraform_aws_key.pem")}"
  }
  provisioner "file" {
    source = "terraform_aws_key.pem"
    destination = "/home/ubuntu/key.pem"
  }
  provisioner "file" {
    source = "scripts"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      "/tmp/scripts/install_docker.sh",
      "ls -la /tmp/scripts",
      "echo 'inline: ${aws_instance.master.private_ip}' ",
      "/tmp/scripts/swarm_worker.sh ${aws_instance.master.private_ip}"
    ]
  }
  tags = { 
    Name = "swarm-${count.index}"
  }
}