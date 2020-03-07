provider "aws" {
  region  = "eu-west-1"
  version = "~>2.51"
}

provider "local" {
  version = "~>1.3"
}

provider "tls" {
  version = "~>2.1.1"
}
