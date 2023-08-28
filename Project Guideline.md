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

Scroll down to “user data” and paste the following bash script from the Bash script file in the directory

Note: This script is as a result of the operating system I selected which is Redhat as a result system manager agent is not pre-installed in it.

So the script downloads and installs the systems manager agent and starts it.

Now in number of instance type 3 click launch instance.

<img width="411" alt="ec2_launch" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/00f8bd8c-bd1d-49ce-a9c7-733a2eca66c7">

Great !!! you have successfully launch your instances.

STEP 3: USING SYSTEMS MANAGER TO RUN COMMANDS ON YOUR INSTANCE

Now head over to the Systems Manager, click Fleet Manager at the left side of the screen.

<img width="1469" alt="system_manager_console" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/082fa4c5-28af-4b59-90b7-656f944a5fdf">

Here your instances with Systems Manager Agent installed will be displayed. Select all three instances.

NOTE: If your instances are not displaying here that means the Systems Manager Agents was not successfully installed, so conect to the instance using SSH, and install the Systems Manager Agent for each instances.

<img width="1381" alt="node_selection" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/f0e87226-c13a-4751-9a42-adb0859511d5">

After selecting your instances click node action, select “Tools” and click “ Execute run command”.

![node_action](https://github.com/McTello/AWS_System_Manager/assets/89931817/74b8cd6e-0d88-4295-a55c-ecea18afa925)

In the search bar type in the type of command you want to excute.

<img width="1119" alt="select_command" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/02c5784f-5de5-4fcd-8ea1-d316fa7b5a52">

For this project we will be using “AWS-RunShellScript” command, so type in the command select it from drop down list.

<img width="1081" alt="command_selected" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/a54691aa-6808-4fef-8d95-6e4ef3b4ffc7">


Now scroll down to the command pallete,here we will writing a command to update the instances. Type “sudo yum update -y” .

<img width="961" alt="command_line" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/ef05ea3b-868a-4fbe-aeb2-2a5a49e62e79">

Scroll down to target selection and select the instances that you want the command to be executed on.


<img width="1130" alt="target_selection" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/bf715fc4-1af4-4582-a1d9-f262f7d6a528">

After selecting your targets click “Run”.

<img width="1150" alt="run_command" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/d53a003d-420a-4215-9c61-f218478d4f05">

Your command status should show “ In progress”.

<img width="1170" alt="command_status_in-progress" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/abc0382a-69f2-4081-bc48-c1fd9f770905">

If successful the overall status changes to “ Success”

<img width="1162" alt="command_status_sucessful" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/9825f410-a6b7-4a98-b4a9-090e98288172">

Congratulations you have successfully used system manager to update a set of instances.

STEP 4

<img width="1470" alt="session_manager_terminal" src="https://github.com/McTello/AWS_System_Manager/assets/89931817/3960a510-cfed-4d3a-b510-987feef3cfaa">

You head over to EC2, select one of the instances and connect using session manager, run the command “sudo yum update -y” you should a message saying “Nothing to do”.

Now you head over to step x in the command pallete type in “sudo shutdown” scroll down and select your targets which are the instances you want to shutdown, scroll and click run. Wait for the overall status to display success.

Congratulations you heard over to the EC2 console to terminate your instances.
