output "ami_id" {
  value = data.aws_ami.amazon_linux_AMI.image_id
}

output "web_adddress" {
  value = "http://${module.ec2_instance.ec2_info.public_ip}"
}

