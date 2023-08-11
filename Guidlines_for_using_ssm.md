# AWS_System_Manager
Using System Manager to run commands on EC2 instance 
AWS Systems Manager gives you visibility and control of your infrastructure on AWS. Systems Manager provides a unified user interface so you can view operational data from multiple AWS services and enables you to automate operational tasks across your AWS resources.
![ssm](https://github.com/McTello/AWS_System_Manager/assets/89931817/ad53acf7-8e9c-402c-b6e8-c7392bc29c71)
In this project, we will be going on a journey that will take you through your first AWS Systems Manager deployment, and it is an honor to be accompanying you.
In this project, we will be going on a journey that will take you through your first AWS Systems Manager deployment, and it is an honor to be accompanying you.

Step 1 : IAM Role creation.

Okay lets get started, for us to be able to use Systems Manager to perfom operations we first need to create an IAM Role Profile for the EC2 instances.

Head over to AWS management console click the search box and type IAM, on the IAM console page at the left side you will see Roles under Access management.

<img width="736" alt="iam_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/6719558e-b585-40e6-9522-ce6e5126bdc1">

Here click the create Role at the right top corner. Under Trusted entity type select AWS service, scroll down to use cases and select EC2.
<img width="1431" alt="ec2_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/e9577da8-a78e-4e47-9387-b9e913ad8fe8">
Now in the permissions policies search for “AmazonEC2RoleforSSM”
<img width="1428" alt="first_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/0660cef3-f371-45c2-9d89-afb2b89171cf">
There is a message displaying under when you select the policy saying the policy will soon be deprecated. So we are told to use “AmazonSSMManagedInstanceCore” policy instead.
<img width="1044" alt="guideline_second_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/7a1abed2-2f28-403f-a7f9-3547eed364f7">
Now go back to the permissions policy and search for “AmazonSSMManagedInstanceCore” click the check box at the left to select it.
<img width="1423" alt="correct_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/afbea14c-dd82-4fa1-924a-8410cbdf5c22">
Now give your Role a name and description.
<img width="1420" alt="name_your_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/90309e1d-4755-4de4-bc41-705c4f4d3b4f">
Verify that it’s the correct policy that is selected, now scroll down and click “create role”.
<img width="1104" alt="create_role" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/d1511f03-976f-422b-81c9-e813d9fdc6cc">

STEP 2 : EC2 Instance creation
Here we launch instances that will be updated using systems manager.

<img width="735" alt="ec2_console" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/bf83e959-3dcd-421f-ab39-57ccffa6201d">

Click launch instance.

<img width="807" alt="os_selection_1" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/345b815d-6045-4900-8995-fabc42e3e8a1">
<img width="764" alt="os_selection_2" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/e668c255-0f7f-46b1-90a5-6633522f0665">

Name your instance
Select an operating system for your instance, leave the default AMI and Architecture

<img width="796" alt="instance_type" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/1bb37b0f-5577-431b-96d6-bd98d06ebae1">

Under instance type select the “Free tier eligible” ones, under keypair login select “ Proceed without a key pair”.

<img width="801" alt="SG_2" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/9345c12f-4b35-4bcd-8c65-b74aa9f040a9">


Under Network settings click “ Select existing security group”.

<img width="788" alt="SG_1" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/2f2fa7ba-46e8-48ec-b141-0d2c0cccb4ae">

Select your default security group.

<img width="809" alt="iam_instance-profile_select_1" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/7713dc5a-87c3-4fd7-bbfa-46aaef94c75e">


Scroll down to “Advance Details” under “IAM instance profile” click and select the IAM role you created earlier.

<img width="779" alt="IAM_instance-profile_select_2" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/bce4f61f-f3c5-4a6b-a6cf-5bb49db36f40">

Scroll down to “user data” and paste the following bash script below.

Note: This script is as a result of the operating system I selected which is Redhat as a result system manager agent is not pre-installed in it.

So the script below downloads the systems manager agent and starts it.

#/bin/bash
sudo dnf install -y https:/ /s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agentpm 
sudo systemctl start amazon-ssm-agent
