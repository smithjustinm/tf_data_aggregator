variable "location" {

}

variable "resource_group_name" {}

variable "service_principal_name" {
  type = string
}

variable "client_id" {}
variable "client_secret" {
  type = string
  sensitive = true
}

variable "k8s_version" {
  description = "Version of Kubernetes to use"
  default = "1.27.2"
}

variable "environment" {
  description = "Environment to deploy to"
  default = "dev"
}
