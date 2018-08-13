output "master_ip" {
  value = "${aws_instance.master.public_ip}"
}

output "master_dns" {
  value = "${aws_instance.master.public_dns}"
}

output "slave_ips" {
  value = ["${aws_instance.slave.*.public_ip}"]
}

output "all_ips" {
  value = ["${aws_instance.master.public_ip}","${aws_instance.slave.*.public_ip}"]
}