region = "eu-west-2"
key_name = "westkey"
name = "threetierapp"

# VPC
vpc_azs = [ "eu-west-2a", "eu-west-2b" ]
vpc_cidr = "10.0.0.0/16"
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_public_subnets  = ["10.0.101.0/24", "10.0.201.0/24"]
vpc_database_subnets = ["10.0.102.0/24", "10.0.202.0/24"]

# DB
db_identifier = "threetierapp"
db_name = "taws"
db_username = "tawsdbuser"