variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "terraform" {
  type = bool
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
}


variable "function_name"{
    type = string
}

variable "endpoint"{
    type= string
}