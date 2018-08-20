output "master_ip" {
  value = "${aws_instance.master.public_ip}"
}

output "master_dns" {
  value = "${aws_instance.master.public_dns}"
}

output "slave_ips" {
  value = ["${aws_instance.slave.*.public_ip}"]
}

output "slave_dns" {
  value = ["${aws_instance.slave.*.public_dns}"]
}

output "all_ips" {
  value = ["${aws_instance.master.public_ip}","${aws_instance.slave.*.public_ip}"]
}

output "UCP_url" {
  value = "https://${aws_instance.master.public_dns}"
}

//output "DTR_url" {
//  value = ["https://${aws_instance.slave.*.public_dns}"]
//}
//output "DTR_url" {
//  value = ["https://${aws_instance.slave.*.public_dns}"]
//}
