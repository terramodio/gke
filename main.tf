resource google_container_cluster cluster {
  cluster_autoscaling {
    enabled = true
    resource_limits {
      resource_type = "cpu"
      minimum = 1
      maximum = 100
    }
    resource_limits {
      resource_type = "memory"
      minimum = 1
      maximum = 100
    }
  }
  initial_node_count = 1
  location = var.region
  logging_service = "logging.googleapis.com/kubernetes"
  min_master_version = var.cluster-version
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  name = var.name
  remove_default_node_pool = true
  ip_allocation_policy {
    use_ip_aliases = var.use-ip-aliases
  }
}

resource google_container_node_pool primary-pool {
  autoscaling {
    max_node_count = var.max-node-count
    min_node_count = var.min-node-cound
  }
  cluster = google_container_cluster.cluster.name
  location = var.region
  management {
    auto_repair = true
  }
  name = "primary-pool"
  node_config {
    machine_type = var.machine-type
    oauth_scopes = var.oauth-scopes
  }
  node_count = var.node-count
  version = var.cluster-version
}