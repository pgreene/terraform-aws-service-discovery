variable name {
  description = "(Required, ForceNew) The name of the service."
  default = null
}

variable description {
  description = "(Optional) The description of the service."
  default = null
}

variable namespace_id {
  description = "(Optional) The ID of the namespace that you want to use to create the service."
  default = null
}

variable force_destroy {
  description = "(Optional, Default:false ) A boolean that indicates all instances should be deleted from the service so that the service can be destroyed without error. These instances are not recoverable."
  default = false
}

variable type {
  description = "(Optional) If present, specifies that the service instances are only discoverable using the DiscoverInstances API operation. No DNS records is registered for the service instances. The only valid value is HTTP."
  default = null
}

variable use_dns_config {
  default = null
}

variable dns_config {
  description = "(Optional) A complex type that contains information about the resource record sets that you want Amazon Route 53 to create when you register an instance."
  default = null
}

variable use_health_check_config {
  default = null
}

variable health_check_config {
  description = "(Optional) A complex type that contains settings for an optional health check. Only for Public DNS namespaces."
  default = null
}

variable use_health_check_custom_config {
  default = null
}

variable health_check_custom_config {
  description = "argument: failure threshold - (Optional, ForceNew) The number of 30-second intervals that you want service discovery to wait before it changes the health status of a service instance. Maximum value of 10."
  default = null
}

variable tags {
  description = "(Optional) A map of tags to assign to the service."
  default = null
}