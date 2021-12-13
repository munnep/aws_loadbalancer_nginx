from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import EC2
from diagrams.aws.network import VPC, PrivateSubnet, PublicSubnet, InternetGateway, NATGateway, ElbApplicationLoadBalancer
from diagrams.onprem.compute import Server

# Variables
outformat = "png"
filename = "simple-diagram"
direction = "LR"


with Diagram(
    direction=direction,
    filename=filename,
    outformat=outformat,
) as diag:
    # Non Clustered
    user = Server("user")
    loadbalancer = ElbApplicationLoadBalancer("Application \n Load Balancer")
    ec2_server_web_server = EC2("web_server")
 
    # Diagram
    user >> loadbalancer >> ec2_server_web_server 

diag
