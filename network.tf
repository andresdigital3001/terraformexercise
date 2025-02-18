terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "example" {
  filename = "output.txt"
  content  = "¡Hola, Terraform sin nube!"
}


