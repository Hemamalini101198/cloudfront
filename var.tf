variable "s3_origin_id" {
  default = "origin id of the s3"
  type = string

}

variable "origin_id" {
  default = "origin id for cloud front"
  type = string
}

variable "env" {
  default = "environment of cloud front distribution"
  type = string  
}

variable "domain_name" {
  description = "domain name for CF"
  type = string
}

variable "target_origin_id" {
  description = "domain name for CF"
  type = string
}
