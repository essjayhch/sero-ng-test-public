terraform {
  source = "./module"
}

dependency "project" {

  config_path = "../../project"
}

dependency "bucket" {
  config_path = "../../bucket"
}

locals {
  secret_vars = yamldecode(sops_decrypt_file("${get_terragrunt_dir()}/secrets.yml"))
}

inputs = merge(
  local.secret_vars,
{
  google_bucket = dependency.bucket.outputs.buckets.0.id
  archive       = "dist.zip"
  project_id    = dependency.project.outputs.project_id
  function_name = "fetch"
  entry_point   = "fetchConsumptionData"
}
)
