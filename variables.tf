variable "instances" {
  description = "A list of instances to create"
  type = list(object({
    compute_name  = string
    machine_type  = string
    zone          = string
    image         = string
    network       = string
    metadata_key  = string
    metadata_startup_script = string
  }))
}