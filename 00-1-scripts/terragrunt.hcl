dependency "00-0-init" {
  config_path = "../00-0-init"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}
