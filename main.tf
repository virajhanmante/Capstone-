module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "capstone-vpc-viraj"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #A Internet Gateway or NAT Gateway are not created by default.
  #Setting the arguments "create_igw" and "enable_nat_gateway" to "true" will cre
enable_nat_gateway = true
  single_nat_gateway = true
  create_igw         = true
  enable_dns_hostnames= true

  public_subnet_tags = {
     "kubernetes.io/cluster/my-eks-201" = "shared"
     "kubernetes.io/role/internal-elb"     = "1"
    Type = "public-subnets"
  }
  private_subnet_tags = {
     "kubernetes.io/cluster/my-eks-201" = "shared"
     "kubernetes.io/role/internal-elb"     = "1"
    Type = "private-subnets"
  }

vpc_tags = {
    Name = "capstone-vpc-viraj"
  }
}
