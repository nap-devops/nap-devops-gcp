
variable "ipfs_params" {
  type = object({
    ase1 = list(string)
    usc1 = list(string)
  })

  nullable = false 
}

variable "gce_ipfs_service_account" {
  type = string
  nullable = false 
}

variable "project" {
  type     = string
  nullable = true
  default = ""
}