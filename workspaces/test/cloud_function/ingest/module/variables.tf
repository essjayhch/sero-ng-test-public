variable "project_id" {
  description = "project id"
  type        = string
}

variable "google_bucket" {
  description = "bucket that contains the code"
  type        = string
}

variable "archive" {
  description = "path to archive file containing the function"
  type        = string
}

variable "prefix" {
  description = "function prefix"
  default     = "sero"
  type        = string
}

variable "function_name" {
  description = "function name"
  type        = string
}

variable "entry_point" {
  description = "entrypoint for app"
  type        = string
}

variable "region" {
  description = "google region"
  type        = string
  default     = "europe-west2"
}

variable "db" {
  description = "database user details"
  type        = map
}
