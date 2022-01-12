# AWS: Steps to create simple EC2 instance 

First create AWS free tier account. After creating account, go to console.aws.amazon.com

## I am currently in Ohio region, i.e. us-east2 region
### Step:1
Search for EC2 service in search box.

### Step:2
Now from left side panel, under Instances, choose instance service. and click on Launch inastance.

![Screenshot 2022-01-12 143728](https://user-images.githubusercontent.com/67470042/149097709-372f4b44-36a0-407f-8034-149dd8acecfa.png)


### Step:3
Now choose any image type you want as long as it is eligible for free tier. Here I am using Amazon Linux 2 AMI (HVM) - Kernel 5.10.

![Screenshot 2022-01-12 144211](https://user-images.githubusercontent.com/67470042/149099268-2aab93ca-060d-44d1-a70b-24c55a916029.png)


### Step:4
Choosing Instance type: Here only t2.micro instance type is eligible for free tier. So let's go for t2.micro.

![Screenshot 2022-01-12 145126](https://user-images.githubusercontent.com/67470042/149100307-1ed3b341-4629-455e-abdb-c66abeadc2af.png)

### Step:5
Configuring instance details.
1) You can launch any number of instance you want. Here I am launching 2 instance having same configuration details.
2) I will leave Network to default network.
3) For subnet I will choose us-east-2b, because I want my instances to be launched in that subnet.
I will leave rest to default.

![Screenshot 2022-01-12 145646](https://user-images.githubusercontent.com/67470042/149103388-6f273fd8-7e0f-42c1-afd1-f164be0bcd08.png)

Now on same page at the very bottom, I will add user data (startup script) [apache-server.sh](https://www.netflix.com/browse) file. This file will be executed when the instance is launched for the very first time. So I want to configure apache webserver that will host an index.php file. Instead of uploading file, you can directly copy and paste your commands as text.

![Screenshot 2022-01-12 150534](https://user-images.githubusercontent.com/67470042/149108824-98f249a8-8a73-46fa-86c2-17bf2c2b9471.png)

### Step:6  
Add Storage. I am not going to add new storage but will change the default size of 8GiB to 10GiB

![Screenshot 2022-01-12 151126](https://user-images.githubusercontent.com/67470042/149111728-f8d399f0-3dda-4cac-97fe-42d60b4febf8.png)

### Step:7
Add tags to your instance. Tags are important to identify your instances. Especially in cases of automations.

![Screenshot 2022-01-12 151308](https://user-images.githubusercontent.com/67470042/149112718-4c7a60da-dc6b-4fa1-864b-87fc6a500dd9.png)

### Step:8
Configure security group. Add one more rule where you are allowing http type of request coming to your server along with allowing ssh request. We have to allow ssh so that we can remotely login to our system and configure it. And as for source, we will allow anyone from the anywhere in the world. 

![Screenshot 2022-01-12 151604](https://user-images.githubusercontent.com/67470042/149114449-de90f67f-67d3-4175-ace7-4ef38b7029d1.png)

### Step:9
Review and launch. Here in this step you will be asked to crate a private key pair or select existing key pair. We have to attach a private key to our instance so that we can login to that instance remotely using software like putty from our local computer.
#### Note: Don't forget to download the key when you crate it because you need it to login to your instance later.
Launch Instance
![Screenshot 2022-01-12 152215](https://user-images.githubusercontent.com/67470042/149117117-a7521d85-65ec-4e85-a27c-a83e10b9cb15.png)

#### As you can see our instance is launched and if you copy public IP of one of the instance and paste it in browser, our web page is loaded. Because we used startup script to preconfigure our instances with apache webserver with it was launching. 

![Screenshot 2022-01-12 152638](https://user-images.githubusercontent.com/67470042/149117915-7e426343-f1ba-4b59-bc15-23217b5c42d5.png)

#### Paste and go in browser

![Screenshot 2022-01-12 152744](https://user-images.githubusercontent.com/67470042/149118118-58f88457-3e6f-4bfd-8ebe-43d239d39c09.png)

#### Go to following DNS name to access my web page I created using load balancer --> [MyWebpage](http://lb-test-101-732610162.us-east-2.elb.amazonaws.com:8080/)
