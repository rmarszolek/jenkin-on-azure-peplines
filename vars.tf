variable "client_id" {} 
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

variable "location" {
  type    = string
  default = "westeurope"
}
variable "prefix" {
  type    = string
  default = "jenkinsx"
}

variable "local_ip_address" {
   type = string
   default = "178.218.234.221"
}


// if null tag not creted 
variable "environmenttag" {
   type= string
   default = null

}
