terraform {
  source = "tfr:///terraform-google-modules/kms/google?version=2.1.0"
}

dependency "project" {
  config_path = "../project"
}
inputs = {
  project_id             = dependency.project.outputs.project_id
  location            = "europe-west2"
  keyring             = "terraform"
  keys                = ["sops"]
  key_rotation_period = "31536000s" # 1 year
}
