#!/bin/bash

###############################################################################
# Author: Varunesh
# Version: v0.0.1

# Script to automate the process of listing all the resources in an AWS account
#
# Below are the services that are supported by this script:
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. EBS
#
# The script will prompt the user to enter the AWS region and the service for which the resources need to be listed.
#
# Usage: ./aws_resource_list.sh  <aws_region> <aws_service>
# Example: ./aws_resource_list.sh us-east-1 ec2
#############################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./aws_resource_list.sh  <aws_region> <aws_service>"
    echo "Example: ./aws_resource_list.sh us-east-1 ec2"
    exit 1
fi

# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$2

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# List the resources based on the service and count them
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        count=$(aws ec2 describe-instances --region $aws_region --query 'Reservations[*].Instances[*].InstanceId' --output text | wc -w)
        echo "List of EC2 Instances are --> $count"
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        count=$(aws rds describe-db-instances --region $aws_region --query 'DBInstances[*].DBInstanceIdentifier' --output text | wc -w)
        echo "List of RDS Instances are --> $count"
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        count=$(aws s3api list-buckets --query 'Buckets[*].Name' --output text | wc -w)
        echo "List of S3 Buckets are --> $count"
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        count=$(aws cloudfront list-distributions --query 'DistributionList.Items[*].Id' --output text | wc -w)
        echo "List of CloudFront Distributions are --> $count"
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        count=$(aws ec2 describe-vpcs --query 'Vpcs[*].VpcId' --output text | wc -w)
        echo "List of VPCs are --> $count"
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        count=$(aws iam list-users --query 'Users[*].UserName' --output text | wc -w)
        echo "List of IAM Users are --> $count"
        ;;
    route53)
        echo "Listing Route53 Hosted Zones in $aws_region"
        count=$(aws route53 list-hosted-zones --query 'HostedZones[*].Id' --output text | wc -w)
        echo "List of Route53 Hosted Zones are --> $count"
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        count=$(aws cloudwatch describe-alarms --query 'MetricAlarms[*].AlarmName' --output text | wc -w)
        echo "List of CloudWatch Alarms are --> $count"
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        count=$(aws cloudformation describe-stacks --query 'Stacks[*].StackName' --output text | wc -w)
        echo "List of CloudFormation Stacks are --> $count"
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        count=$(aws lambda list-functions --query 'Functions[*].FunctionName' --output text | wc -w)
        echo "List of Lambda Functions are --> $count"
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        count=$(aws sns list-topics --query 'Topics[*].TopicArn' --output text | wc -w)
        echo "List of SNS Topics are --> $count"
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        count=$(aws sqs list-queues --query 'QueueUrls[*]' --output text | wc -w)
        echo "List of SQS Queues are --> $count"
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        count=$(aws dynamodb list-tables --query 'TableNames[*]' --output text | wc -w)
        echo "List of DynamoDB Tables are --> $count"
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        count=$(aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --output text | wc -w)
        echo "List of EBS Volumes are --> $count"
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
