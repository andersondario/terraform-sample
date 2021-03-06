terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "4.19.0"
		}
	}

	backend "remote" {
		organization = "andersondario"
		workspaces {
			name = "dummy-app-development" 
		}
	}
}

provider "aws" {
	region     = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}

module "ecs" {
	source       = "../../../modules/aws/ecs"  
	cluster_name = "cluster-qa"
	app_name     = "dummy-app"
	env_name     = "development"
	app_count    = 1
}
