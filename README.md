# AWS_Shell--script-Project

We write a shell script which will connect to the aws and it will list the active resources of the aws serviuces 
to find the active resource on aws account.



# **Create an EC2 Instance:**

* Go to EC2 console

* And select launch instance

* Name the EC2  instance and Select Ubuntu AMI

*  And launch our Instance

*  And run sudo apt update command

![image](https://github.com/user-attachments/assets/ad949933-770c-4d9c-bda8-cbb4e6864a1f)


# **Install AWS CLI:**

* We use AWS CLI in shell script to talk on our behalf instead of using API

* And  we need to configure  after installing AWS CLI

* To install it we can visit the offical doc. of AWS CLI and run those commands

```yaml
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```


* Run this command to install unzip
```yaml
sudo apt install unzip -y
```
* After installing we can verify to see if its installed

  ![Screenshot 2024-08-15 113628](https://github.com/user-attachments/assets/d5fc819c-8e91-4f82-868e-91a87f7a1ef5)

  
# **AWS Configure:**

* To configure aws cli we need to give Access key ID and Password

# **Output:**

*We need towrite command as we gave in our shellscript or we could face error
![Screenshot 2024-08-15 114232](https://github.com/user-attachments/assets/1a3a1964-2122-4682-bd0f-5bd7306ea416)

* we can see  the list of ec2 

![Screenshot 2024-08-15 114307](https://github.com/user-attachments/assets/cb11db59-a11c-4f1f-8f90-e2da7d58b54d)

*If we just need to see only number of services we can use this command:
* For ec2 

```yaml
count=$(aws ec2 describe-instances --region $aws_region --query 'Reservations[*].Instances[*].InstanceId' --output text | wc -w)
echo "List of EC2 Instances are --> $count"

```
![Screenshot 2024-08-15 115357](https://github.com/user-attachments/assets/5f7a2c37-b1af-43ec-9159-d42eef5c2f6f)



  


 
