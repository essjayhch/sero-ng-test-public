terraform {
  source = "./module"
}

dependency "project" {
  config_path = "../project"
}

inputs = {
  project_id = dependency.project.outputs.project_id
  accounts = [
    {
      id = "cloudsql-user"
    }
  ]
}
