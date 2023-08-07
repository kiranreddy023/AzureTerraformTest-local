resource "local_file" "testfile" {
  filename = var.test
  content  = var.values
}

variable "test" {
  default = "default.txt"
}

variable "values" {
  default = "this is a variable given in default var block"
}
