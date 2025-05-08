
# Create a VPC, public subnet, internet gateway, and public route to the internet.

# VPC
resource "aws_vpc" "main" {
    cidr_block          = var.vpc_cidr
    enable_dns_support  = true
    enable_dns_hostnames= true
    tags ={
        "Name" = "main-vpc"
    }
}

# Public Subnet
resource "aws_subnet" "public" {
    cidr_block              = var.subnet_cidr_list[0]
    map_public_ip_on_launch = true
    vpc_id                  = aws_vpc.main.vpc_id
    availability_zone       = "${var.region}a"
    
}

# Internet gatway to enable trafic from internet
resource "aws_internet_gateway" "main" {
    vpc_id  =   aws_vpc.main.id
    tags = {
        "Name" ="main-IG"
    }
}

# Public Route Table
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    tags = {
        "Name" = "public-route"
    }
}

# Associate public subnet to route table
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

# Route to interent gateway for public subnet
resource "aws_route" "public_intenet_access" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id

}