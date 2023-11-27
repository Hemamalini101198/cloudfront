variable "s3_origin_id" {
  default = "origin id of the s3"
  type = string

}
/*
variable "admin_domain_name" {
  default = "admin domain name for cloud front"
  type = string
}
*/
variable "env" {
  default = "environment of cloud front distribution"
  type = string  
}
/*
variable "domain_name" {
  description = "domain name for CF"
  type = string
}*/