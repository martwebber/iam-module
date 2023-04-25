variable "region" {
  description = "Region to create resources in"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be used in the project"
  type        = map(any)
  default     = {}
}

variable "policy_name" {
  description = "Policy name"
  type        = string
  default     = "test_policy"
}

variable "policy_description" {
  description = "Policy description"
  type        = string
  default     = ""
}

variable "policy_path" {
  description = "Path in which to create the policy"
  type        = string
  default     = "/"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "terraform-aws-iam"
}

variable "user_name" {
  description = "IAM user name"
  type        = string
  default     = "" #required
}

variable "user_path" {
  description = "IAM user path"
  type        = string
  default     = "/system/" #required
}

#(Optional) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists, 
#for use in the encrypted_secret output attribute. If providing a base-64 encoded PGP public key,
# make sure to provide the "raw" version and not the "armored" one (e.g. avoid passing the -a option to gpg --export).
variable "access_key_pgp_key" {
  description = "IAM access key pgp key"
  type        = string
  default     = "keybase:some_person_that_exists" #optional
}

variable "access_key_user" {
  description = "IAM access key user"
  type        = string
  default     = "" # required
}

variable "access_key_status" {
  description = "(Optional)Access key status to apply. Defaults to Active. Valid values are Active and Inactive. "
  type        = string
  default     = "Active"
}

variable "account_alias" {
  description = "(Required) The account alias"
  type        = string
  default     = "alias"
}

variable "account_password_policy_minimum_password_length" {
  description = "(Optional) Minimum length to require for user passwords."
  type        = number
  default     = "8"
}

variable "account_password_policy_require_lowercase_characters" {
  description = "(Optional) Whether to require lowercase characters for user passwords."
  type        = bool
  default     = true
}

variable "account_password_policy_require_numbers" {
  description = "(Optional) Whether to require numbers for user passwords."
  type        = bool
  default     = true
}

variable "account_password_policy_require_uppercase_characters" {
  description = " (Optional) Whether to require uppercase characters for user passwords."
  type        = bool
  default     = true
}

variable "account_password_policy_require_symbols" {
  description = " (Optional) Whether to require symbols for user passwords."
  type        = bool
  default     = true
}

variable "account_password_policy_allow_users_to_change_password" {
  description = "(Optional) Whether to allow users to change their own password"
  type        = bool
  default     = true
}

variable "account_password_policy_hard_expiry" {
  description = "(Optional) Whether users are prevented from setting a new password after their password has expired (i.e., require administrator reset)"
  type        = bool
  default     = true
}

variable "account_password_policy_max_password_age" {
  description = "(Optional) The number of days that an user password is valid."
  type        = number
  default     = 60
}

variable "account_password_policy_password_reuse_prevention" {
  description = " (Optional) The number of previous passwords that users are prevented from reusing."
  type        = number
  default     = 5
}

variable "group_name" {
  description = "(Required) The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.."
  type        = string
  default     = "devs"
}

variable "group_path" {
  description = "(Optional, default '/') Path in which to create the group."
  type        = string
  default     = "/"
}

variable "group_membership_name" {
  description = "(Required) The name to identify the Group Membership"
  type        = string
  default     = "tf-testing-group-membership"
}

variable "group_membership_group" {
  description = "(Required) The name to identify the Group Membership"
  type        = list(any)
  default     = []
}

variable "group_policy_name" {
  description = "(Optional) The name of the policy. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = ""
}
