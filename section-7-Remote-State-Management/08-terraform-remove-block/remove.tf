# resource "local_file" "example" {
#   filename = "${path.module}/example.txt"
#   content  = "This is an example file."
# }

removed {
  from = local_file.example // <-- Resource to remove block from

  lifecycle {
    destroy = false
  } 
}