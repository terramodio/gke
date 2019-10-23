variable name {}
variable region {}
variable cluster-version {}

variable use-ip-aliases { default = true }

variable machine-type { default = "n1-standard-1" }
variable node-count { default = 1 }
variable min-node-count { default = 1 }
variable max-node-count { default = 3 }
variable oauth-scopes {
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/cloud_debugger",
    "https://www.googleapis.com/auth/trace.append",
  ]
}
