variable "storage_service_account_id" {
  description = "The account id of the service account"
  type        = string
}

variable "region" {
  description = "The region of the project"
  type        = string
}

variable "backend_bucket_name" {
  description = "The name of the backend bucket"
  type        = string

}

variable "backend_prefix" {
  description = "The prefix of the backend bucket"
  type        = string
}

variable "project_id" {
  description = "The project id of the project"
  type        = string
}

variable "general_node_machine_type" {
  description = "The machine type of the general node"
  type        = string
}

variable "spot_node_machine_type" {
  description = "The machine type of the spot node"
  type        = string
}

variable "cluster_primary_zone" {
  description = "The location of the primary cluster"
  type        = string
}

variable "cluster_multi_zones" {
  description = "The location of the multi cluster"
  type        = list(string)
}

variable "kubernetes_service_account_id" {
  description = "The service account of the kubernetes cluster"
  type        = string
}

variable "gke_cluster_name_primary" {
  description = "The name of the kubernetes cluster"
  type        = string
}
