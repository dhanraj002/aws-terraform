resource "aws_kms_key" "doc-db-kms" {
  description             = "Key for encrypting doc db"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  key_usage  = "ENCRYPT_DECRYPT"
  is_enabled = true

  tags = {
    Name             = "docdb-key"
    EnvType          = var.aws_account_env
    Provisioner      = "terraform"
  }
}
resource "aws_kms_alias" "doc-db_key_alias" {
  name          = "alias/tf-docdb-${var.aws-account-env}-key"
  target_key_id = aws_kms_key.doc-db-kms.key_id
}