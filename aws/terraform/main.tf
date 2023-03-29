# Cria um bucket
resource "aws_s3_bucket" "meuBucket" {
  bucket = "apagar-meu-teste-de-bucket-terraform-dev"

  tags = {
    Name        = "meuBucket"
    Environment = "Dev"
  }
}

# Cria uma ACL para o bucket
resource "aws_s3_bucket_acl" "exemploACL" {
  bucket = aws_s3_bucket.meuBucket.id
  acl    = "private"
}

