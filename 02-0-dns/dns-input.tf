
variable "top_level_domain" {
  type     = string
  nullable = false 
}

variable "top_level_domain2" {
  description = "Custom domain name."
  type        = string
  default     = ""
}
