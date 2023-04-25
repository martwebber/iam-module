provider "aws" {
  region = var.region
}

resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  tags = merge(
    var.tags,
    {
      Name = "${var.region}-${var.project}-iam-policy"
    },
  )
}


resource "aws_iam_access_key" "lb" {
  user    = aws_iam_user.lb.name
  pgp_key = var.access_key_pgp_key
  status  = var.access_key_status

  # tags = merge(
  #   var.tags,
  #   {
  #     Name = "${var.region}-${var.project}-iam-access-key"
  #   },
  # )
}

resource "aws_iam_account_alias" "alias" {
  account_alias = var.account_alias
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = var.account_password_policy_minimum_password_length
  require_lowercase_characters   = var.account_password_policy_require_lowercase_characters
  require_numbers                = var.account_password_policy_require_numbers
  require_uppercase_characters   = var.account_password_policy_require_uppercase_characters
  require_symbols                = var.account_password_policy_require_symbols
  allow_users_to_change_password = var.account_password_policy_allow_users_to_change_password
  password_reuse_prevention      = var.account_password_policy_password_reuse_prevention
  max_password_age               = var.account_password_policy_max_password_age
  hard_expiry                    = var.account_password_policy_hard_expiry
}

resource "aws_iam_group" "developers" {
  name = var.group_name
  path = var.group_path
}

resource "aws_iam_group_membership" "team" {
  name = var.group_membership_name

  users = var.group_membership_group

  group = aws_iam_group.developers.name
}

resource "aws_iam_group_policy" "my_developer_policy" {
  name  = var.group_policy_name
  group = aws_iam_group.developers.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = merge(
    var.tags,
    {
      Name = "${var.region}-${var.project}-iam-user"
    },
  )
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.lb.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
