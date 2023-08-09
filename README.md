# AWS_System_Manager
Using System Manager to run commands on EC2 instance 
AWS Systems Manager gives you visibility and control of your infrastructure on AWS. Systems Manager provides a unified user interface so you can view operational data from multiple AWS services and enables you to automate operational tasks across your AWS resources.
![ssm](https://github.com/McTello/AWS_System_Manager/assets/89931817/ad53acf7-8e9c-402c-b6e8-c7392bc29c71)
In this project, we will be going on a journey that will take you through your first AWS Systems Manager deployment, and it is an honor to be accompanying you.
In this project, we will be going on a journey that will take you through your first AWS Systems Manager deployment, and it is an honor to be accompanying you.

Step 1 : IAM Role creation.

Okay lets get started, for us to be able to use Systems Manager to perfom operations we first need to create an IAM Role Profile for the EC2 instances.

Head over to AWS management console click the search box and type IAM, on the IAM console page at the left side you will see Roles under Access management.
![iam_role.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f8886f7f-727f-4345-8dba-ab49dff66725/iam_role.png)
Here click the create Role at the right top corner. Under Trusted entity type select AWS service, scroll down to use cases and select EC2.
![ec2_role.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7eb27e36-57db-40eb-8e4e-807de756271a/ec2_role.png)
