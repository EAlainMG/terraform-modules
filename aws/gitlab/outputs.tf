output "eip" {
  value = module.gitlab.eip
}

output "instance" {
  value = module.gitlab.this
}

output "sg" {
  value = module.gitlab.sg
}

output "backup_user" {
  value = module.bucket_iam.user
}