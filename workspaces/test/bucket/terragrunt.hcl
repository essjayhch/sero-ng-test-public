terraform {
  source = "tfr:///terraform-google-modules/cloud-storage/google?version=3.4.1"
}
dependency "project" {
  config_path = "../project"
}
inputs = {
  project_id = dependency.project.outputs.project_id
  names      = ["app", ]
  prefix     = "sero-test"

  versioning = {
    first = true
  }

  storage_class = "STANDARD"
  location      = "europe-west2"
}
