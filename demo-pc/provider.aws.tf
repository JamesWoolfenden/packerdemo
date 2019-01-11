provider "aws" {
  region  = "eu-west-1"
  version = "1.55"
}

provider "local" {
  version = "1.1"
}

provider "tls" {
  version = "1.2"
}
