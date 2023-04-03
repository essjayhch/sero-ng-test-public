terraform {
  source = "./module"
}

dependency "fetch" {
  config_path = "../cloud_function/fetch"
}

dependency "project" {
  config_path = "../project"
}
inputs = {
  fetch_name = dependency.fetch.outputs.name
  project_id = dependency.project.outputs.project_id
}
