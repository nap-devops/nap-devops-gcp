dependency "04-0-computes-wp" {
  config_path = "../04-0-computes-wp"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}
