variable "location" {
  type    = string
  default = "westeurope"
}
variable "prefix" {
  type    = string
  default = "jenkins"
}

variable "local_ip_address" {
   type = string
   default = ""
}


// if null tag not creted 
variable "environmenttag" {
   type= string
   default = null

}
