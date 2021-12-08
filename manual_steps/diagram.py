from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet, Endpoint, ELB, Route53
import argparse, sys, os
from diagrams import Cluster, Diagram, Edge
from diagrams.aws.compute import ECS, Fargate,EC2
from diagrams.aws.network import (
    VPC,
    PrivateSubnet,
    PublicSubnet,
    InternetGateway,
    NATGateway,
    ElbApplicationLoadBalancer,
)
from diagrams.aws.security import WAF
from diagrams.onprem.compute import Server

#######################################################
# Setup Some Input Variables for Easier Customization #
#######################################################
title = "VPC with a webserver"
outformat = "png"
filename = "vpc-diagram"
filenamegraph = "out/diagrams-as-code-aws-vpc-example.gv"
show = False
direction = "LR"
smaller = "0.8"


with Diagram(
    name=title,
    direction=direction,
    show=show,
    filename=filename,
    outformat=outformat,
) as diag:
    # Non Clustered
    user = Server("user")


    # Cluster = Group, so this outline will group all the items nested in it automatically
    with Cluster("vpc"):
        igw_gateway = InternetGateway("igw")

        # Subcluster for grouping inside the vpc
        with Cluster("subnet_public1"):
            loadbalancer1 = ElbApplicationLoadBalancer("loadbalancer")
            nat_gateway = NATGateway("nat_gateway")
        with Cluster("subnet_public2"):
            loadbalancer2 = ElbApplicationLoadBalancer("loadbalancer")
         # Another subcluster equal to the subnet one above it
        with Cluster("subnet_private1"):
            ec2_server_web_server = EC2("web_server")
 
    ###################################################
    # FLOW OF ACTION, NETWORK, or OTHER PATH TO CHART #
    ###################################################
    user >> [loadbalancer1,
             loadbalancer2] >> ec2_server_web_server

diag
