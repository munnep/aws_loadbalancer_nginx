# aws_loadbalancer_nginx
AWS loadbalancer Nginx


# done
- [x] create VPC
- [x] create 2 subnets, one for public network, one for private network
- [x] create internet gw and connect to public network with a route table
- [x] create nat gateway, and connect to private network with a route table
- [x] route table association with the subnets 

# to do
- [] create ec2 instance without public ip, only private subnet
- [] create a LB (check Application Load Balancer or Network Load Balancer)
- [] publish a service over LB, ie nginx

