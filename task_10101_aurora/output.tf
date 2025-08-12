output "security_group_id" {
  value = aws_security_group.my_aurora_sg.id
}
output "db_instance_endpoint" {
  value = aws_rds_cluster_instance.cluster_instances.endpoint
}
