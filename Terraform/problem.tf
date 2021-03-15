provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.aws_region
}

variable "youse_bucket_list" {
    type = list
    default = [
        {
            name = "crazy-reports-hourly"
            expiration = 0.041
        },
        {
            name = "crazy-reports-daily"
            expiration = 1
        },
        {
            name = "crazy-reports-weekly",
            expiration = 7
        }
    ]
  
}

resource "aws_kms_key" "yousekey" {
    description = "Key for encrypting"
    deletion_window_in_days =  10
}

resource "aws_s3_bucket" "youse_buckets" {
    for_each = { for y in var.youse_bucket_list : y.name => y }
    bucket = each.value.name
    acl = "private"
    region = "us-east-1"

    lifecycle_rule {
        enabled = true
        expiration {
            days = each.value.expiration
      }
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = aws_kms_key.yousekeu.arn
                sse_algorithm = "aws:kms"
            }
        }
    }

    versioning {
        enabled = true
    }
}