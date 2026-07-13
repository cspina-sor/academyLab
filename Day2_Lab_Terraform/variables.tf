variable "student_name" {
  type        = string
  description = "Nome dello studente per il naming delle risorse"
}

variable "resource_group_name" {
  type        = string
  description = "Nome del Resource Group esistente (da Day 1)"
}

variable "sku_name" {
  type        = string
  description = "SKU dell'App Service Plan"
  default     = "F1"
}

variable "tags" {
  type        = map(string)
  description = "Tag da applicare alle risorse"
  default = {
    Environment = "Lab"
    Day         = "2"
  }
}
