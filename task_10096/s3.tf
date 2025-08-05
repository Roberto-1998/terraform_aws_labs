resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}


resource "aws_s3_bucket" "bucket" {
  bucket        = "whizbucket-${random_string.random.result}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  key    = "whizlabs_logo_58_32.png"
  source = "image/whizlabs_logo_58_32.png"
  etag   = filemd5("image/whizlabs_logo_58_32.png")
}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.bucket.id
  policy = <<EOF
    {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:list*",
        "s3:get*",
        "s3:putobject"
        ],
      "Resource": [
        "${aws_s3_bucket.bucket.arn}",
        "${aws_s3_bucket.bucket.arn}/*"
      ]
    }
  ]
}
  EOF
}

