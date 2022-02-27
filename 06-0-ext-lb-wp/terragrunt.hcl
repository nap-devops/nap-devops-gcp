dependency "05-0-isg-wp" {
  config_path = "../05-0-isg-wp"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}
