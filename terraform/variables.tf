variable "project" {
  description = "Google project where we want to deploy our solution"
  type        = string
  default     = "engineer-cloud-nprod"
}

variable "region" {
  description = "Selected region deploy the solution to"
  type        = string
  default     = "us-central1"
}
variable "zone" {
  description = "Selected zone for redis instance"
  type        = string
  default     = "us-central1-a"
}
variable "alternative_zone" {
  description = "Selected alternative zone for redis instance"
  type        = string
  default     = "us-central1-c"
}
variable "private_network_name" {
    type        = string
    description = "The private network name"
    default     = "app-network"
}