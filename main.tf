resource "aws_service_discovery_service" "general" {
  name = var.name
  description = var.description
  namespace_id = var.namespace_id
  force_destroy = var.force_destroy
  type = var.type

  dynamic "dns_config" {
    for_each = var.use_dns_config == null ? [var.dns_config] : []
    content {
      namespace_id = try(dns_config.value.namespace_id, null)
      routing_policy = try(dns_config.value.routing_policy, null)
      dynamic "dns_records" {
        for_each = try([dns_config.value.dns_records], [])
        content {
          ttl = try(dns_records.value.ttl, null)
          type = try(dns_records.value.type, null)
        }
      }
    }
  }

  dynamic "health_check_config" {
    for_each = var.use_health_check_config == null ? [var.health_check_config] : []
    content {
      failure_threshold = try(health_check_config.value.failure_threshold, null)
      resource_path = try(health_check_config.value.resource_path, null)
      type = try(health_check_config.value.type, null)
    }
  }

  dynamic "health_check_custom_config" {
    for_each = var.use_health_check_custom_config == null ? [var.health_check_custom_config] : []
    content {
      failure_threshold = try(health_check_custom_config.value.failure_threshold, null)
    }
  }

  tags = var.tags

}

