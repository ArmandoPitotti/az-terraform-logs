variable "resource_group_name" {}
variable "resource_group_location" {}

variable "log_analytics_workspace_sku" {
  default = "Free"
}

variable "daily_quota_gb" {
  type        = number
  default     = 0.05
}

variable "retention_in_days" {
    type      = number
    default     = 30
}