variable "name" {
  type        = string
  description = "The group's name"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the group"
}

variable "users" {
  type        = list(string)
  description = "A list of IAM User names to associate with the Group"
}

variable "policy_arn" {
  type        = string
  description = "The ARN of the policy you want to apply"
}
