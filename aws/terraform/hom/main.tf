# Cria um bucket
resource "aws_s3_bucket" "meuBucket" {
  bucket = "apagar-meu-teste-de-bucket-terraform-hom"


  tags = {
    Name        = "meuBucket"
    Environment = "${var.environment}"
  }
}

# Cria uma ACL para o bucket
resource "aws_s3_bucket_acl" "examploACL" {
  bucket = aws_s3_bucket.meuBucket.id
  acl    = var.acl_value
}

# Bloqueia todas as formas de acesso públicas
resource "aws_s3_bucket_public_access_block" "examploBlock" {
  bucket = aws_s3_bucket.meuBucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}