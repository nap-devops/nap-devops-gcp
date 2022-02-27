dependency "01-0-vpc" {
  config_path = "../01-0-vpc"
  skip_outputs = true
}

dependency "00-1-scripts" {
  config_path = "../00-1-scripts"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}
