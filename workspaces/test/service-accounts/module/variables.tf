variable "project_id" {
  description = "project identifier"
  type        = string
}

variable "accounts" {
  type = list(any)
}
