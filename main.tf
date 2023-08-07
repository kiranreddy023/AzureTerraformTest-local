resource "local_file" "linuxfile1" {
  filename = "Linuxfile.txt"
  content  = "file created in linux server"
}

resource "local_file" "linuxfile2" {
  filename = "/home/kiran/newdir/Linuxfile.txt"
  content  = "file created in linux server"
}

resource "random_string" "filename1" {
  length           = 20
  special          = true
  override_special = "/@£$"
}

resource "random_shuffle" "names" {
  input        = ["kiran", "kumar", "reddy", "vepanjeri"]
  result_count = 2
}
resource "random_password" "password" {
  length           = 8
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "random_id" "randomid" {
  byte_length = 8
}
