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


