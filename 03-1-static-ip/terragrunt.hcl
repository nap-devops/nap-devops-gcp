dependency "02-0-dns" {
  config_path = "../02-0-dns"
  skip_outputs = true
}

include "root" {
  path = find_in_parent_folders()
}
