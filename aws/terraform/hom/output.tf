output "s3_bucket_arn" {
    description = "ARN do bucket criado."
    value = aws_s3_bucket.meuBucket.arn
}

output "s3_bucket_acl_bucket_name" {
    description = "Nome do bucket em que a ACL foi aplicada."
    value = aws_s3_bucket_acl.examploACL.bucket
}

output "s3_bucket_acl_id" {
    description = "ID da ACL criada."
    value = aws_s3_bucket_acl.examploACL.id
}