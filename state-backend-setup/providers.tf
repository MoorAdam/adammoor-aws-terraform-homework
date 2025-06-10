provider "aws" {
  region = "eu-central-1"
  profile = "codefactory"
  assume_role {
    role_arn = "arn:aws:iam::239762172680:role/terragrunt-execution-role"
    session_name = "adammoor-codefactory-session"
  }
}