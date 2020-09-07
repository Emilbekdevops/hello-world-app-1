module "academy-deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "hello-world"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
  deployment_path        = "hello-world"
  credentials            = "${var.credentials}"
  template_custom_vars  = {     
    deployment_image     = "${var.deployment_image}"
   }
  
 }
 
output "application_endpoint" {
    value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}
variable  "deployment_image" {
    default = "docker.fuchicorp.com/hello-world-app-dev-feature:4b7aacb"
}

variable "deployment_environment" {
    default = "stage"
}

variable "deployment_endpoint" {
    type = "map"
     default = {
        test                 = "test.data-miner"
        dev                  = "dev.data-miner"
        qa                   = "qa.data-miner"
        prod                 = "data-miner"
        stage                = "stage.data-miner"
 }
}

variable "google_domain_name" {
    default = "fuchicorp.com"
}

variable "credentials" {
    default = "common-service-account.json"
    description = "- (Optional) Google Service account Json file."
}