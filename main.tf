resource "aws_vpc" "main" {
  cidr_block = "10.233.0.0/16"

  tags = {
    Name = "patrick-vpc"
  }
}

# resource "aws_subnet" "public1" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.233.1.0/24"
#   availability_zone = "eu-central-1a"
#   tags = {
#     Name = "patrick-public"
#   }
# }

# resource "aws_subnet" "public2" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.233.2.0/24"
#   availability_zone = "eu-central-1b"

#   tags = {
#     Name = "patrick-public2"
#   }
# }

# resource "aws_subnet" "private" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.233.11.0/24"
#   availability_zone = "eu-central-1a"
#   tags = {
#     Name = "patrick-private"
#   }
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "patrick-gw"
#   }
# }


# resource "aws_route_table" "publicroutetable" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "patrick-route-table"
#   }
# }

# resource "aws_route_table" "privateroutetable" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.NAT.id
#   }
# }

# resource "aws_route_table_association" "PublicRT1" {
#   subnet_id      = aws_subnet.public1.id
#   route_table_id = aws_route_table.publicroutetable.id
# }

# resource "aws_route_table_association" "PublicRT2" {
#   subnet_id      = aws_subnet.public2.id
#   route_table_id = aws_route_table.publicroutetable.id
# }


# resource "aws_route_table_association" "PrivateRT" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.privateroutetable.id
# }

# resource "aws_eip" "nateIP" {
#   vpc = true
# }


# resource "aws_nat_gateway" "NAT" {
#   allocation_id = aws_eip.nateIP.id
#   subnet_id     = aws_subnet.public1.id
# }

# resource "aws_security_group" "web_server_sg" {
#   vpc_id      = aws_vpc.main.id
#   name        = "web_server_sg"
#   description = "web_server_sg"

#   ingress {
#     description = "https from internet"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "http from internet"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "icmp from internet"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "icmp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "patrick-web_server_sg"
#   }
# }




# resource "aws_network_interface" "web-priv" {
#   subnet_id   = aws_subnet.private.id
#   private_ips = ["10.233.11.1"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

# data "cloudinit_config" "server_config" {
#   gzip          = true
#   base64_encode = true
#   part {
#     content_type = "text/cloud-config"
#     content      = file("${path.module}/webserver.yml")
#   }
# }



# # resource "aws_instance" "web_server" {
# #   ami           = "ami-083654bd07b5da81d"
# #   instance_type = "t2.micro"
# #  # key_name      = "patrick-key-pair"

# #   network_interface {
# #     network_interface_id = aws_network_interface.web-priv.id
# #     device_index         = 0
# #   }

# #   user_data = data.cloudinit_config.server_config.rendered
# #   tags = {
# #     Name = "patrick-webserver"
# #   }
# # }



# resource "aws_network_interface_sg_attachment" "sg_attachment" {
#   security_group_id    = aws_security_group.web_server_sg.id
#   network_interface_id = aws_network_interface.web-priv.id
# }

