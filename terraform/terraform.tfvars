aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidr  = "10.0.2.0/24"
availability_zone    = "us-east-1a"
instance_type        = "t2.micro"
ami_id               = "ami-000ec6c25978d5999" # Example: Amazon Linux 2 (update as per region)
key_pair             = "Alok_key_pair_pb"    # Replace with your actual key pair
# we can set credentils in aws secret manager 
aws_access_key = "passed from local"
aws_secret_key = "passed from local"
