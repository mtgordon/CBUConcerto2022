# CBUConcerto2022
<!-- This content will not appear in the rendered Markdown -->

- [ ] paste all of the documentation to github
- [ ] add images to the github
- [ ] format the documentation
- [ ] share the page:tada:

~~This was mistaken text~~

hehe <sub>This is a subscript text</sub>

hehe <sup>This is a superscript text</sup>

# Smarter Testing: Concerto Online Testing Software

Concerto Documentation

Version: 1.0.0
Revision: A

Period of Performance: 01/24/2020 – 04/25/2020

Josh Freeman / Grimaldy Gunawan / Riley Verdier

#

Period of Performance: 09/24/2022 – 04/25/2023

Christopher Schilling / Ezekiel Ramirez / Jacob Eaton / Tyler Adcock

EGR302-F Engineering Document and Design
DR. Gordon


[link to github readme syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

[Advanced syntax](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting)

# Table of Contents
1. Introduction
2. Setting up Concerto
3. Navigating Concerto
4. Ezekiel
5. Jacob
6. Simple CAT Test Creation
7. Test with Group Questions Creation
8. References and Tools
9. Acronyms
10. Terms and Definition
11. Troubleshooting

# 1. Introduction
## 1.1 Purpose
This document is created to illustrate the uses and capabilities of the Concerto platform. In here users of the Concerto platform will find all the necessary tools and instructions to create proper Computerized Adaptive Tests (CAT). 
## 1.2 Concerto Overview
The University of Cambridge Psychometrics Centre believes that online adaptive testing should be available to everyone. 
That is why we’ve built Concerto: a powerful and user-friendly platform that empowers experts and beginners alike to make better tests, without needing to write a single line of code. 
There are no set-up costs, no hidden license fees and no limitations. 
This ensures our community of researchers and practitioners can take on both short- and long-term assessment projects with confidence.

Concerto harmonizes the statistical power of the R programming language, the security of MySQL databases and the flexibility of HTML to deliver an outstanding performance. 
These instruments work in unison, giving users unparalleled freedom and control over the design of their assessments. 
In-built algorithms for score calculation and report generation ensure a rewarding experience for participants, whatever the context.


# 2. Setting up Concerto
This section will provide the proper instruction for users to set up their Concerto platform. 
Users will have a better understanding of how to properly set up their system to conform to Concerto restrictions

## 2.1	Step 1 - Navigating through Concerto Website

First, we will begin by visiting the concerto website by clicking on the link below:

[Concerto Website](https://concertoplatform.com/)

Once the link has been clicked you will be taken to a website the looks like the image below:
 
  IMAGE HERE
  
Once on the website we want to go click on the documentation tab in the top right-hand corner. Shown in the image below:

  IMAGE HERE
  
A Web page will then open up and we want to click on the “SEE DOCUMENTATION” button in the middle of the screen

  IMAGE HERE

## 2.2	Step 2 - Creating an Amazon AWS account
Concerto Documentation Web Page should now pop up. 
Now we want to Click on the “QuickStart Guide” that is under the heading “Running Concerto”. 
If you already have an Amazon AWS account fill free to skip to the latter sections by clicking on this hyperlink

This link will direct you to a page where Concerto will show the user how to set up Concerto on your machine. 
We DO NOT want to use their guide. Instead follow this documentation as you will minimize the likelihood of running into errors. 
With that being said we will now scroll down to the “Installation on Amazon EC2” and under this subheading you will click on the “Amazon AWS account” link. 

## 2.3	Step 3 - Navigating through Amazon AWS
This will direct you to the Amazon AWS page. 
In order for Concerto to be docked into your machine we must first create an Amazon AWS account.

### 2.3.1	Creating an Amazon AWS account
If you are new to Amazon AWS, this section will help you set up an AWS account. 
Once on the Amazon AWS account we want to click on “Sign in to Console” in the upper right-hand corner.

This button will then bring you to Amazon’s AWS login page. 
Here since we do not have an account we want to click on “Create a new AWS account”

This will then bring you to Amazon’s account creation page. 
Here you will fill out all the necessary fields that are required to create an account once finished you can click the “Continue” button. 

### 2.3.2	Creating a Key Pair
Once you have created an Amazon AWS account, we will now create a Key Pair for our Amazon Stack. 
If you are not already in the concerto document page you can click HERE to navigate to the Concerto Documentation page. 
Once on the documentation page click on the “QuickStart Guide”

This again will bring you to Concerto’s QuickStart guide GitHub page. 
We now want to scroll down to the “Installation on Amazon” heading and we want to now click on the “Create Key Pair” Link

This link will now open to the Amazon AWS login in web page. 
Here we want to click “Root User” then fill out the required field with the email address associated with the account. Once that is all done click the “Next” button

This button will lead you to a page where it will require you to fill out the password associated with your Amazon AWS account. 
Once this is filled out click the “Sign in” button to sign in into Amazon AWS

Once Signed in, you will be redirect to a page that looks like the image below. 
We will then proceed to click on the Create Key pair near the top right-hand corner

We will now proceed to creating a key pair. Please follow this step very carefully. 
If not done properly you could potentially receive an error that is similar to THIS. 
Please fill in the required components exactly as state in this document. 
Under name please type in “concerto”. For the file format chose the “pem” option. 
Then click “Add Tag” and under the Key field, type in “concerto”. 
Then click “Create key pair” The final result should look as follows:

This process should now have created a Key Pair called concerto. 
This Key Pair is now listed within the Key Pairs on your account

Once the Key Pair has been created, exit out of this web page by clicking the “X” button on the tab of your browser. 
This is an important step as this may cause this error if this step is not executed

### 2.3.3	Creating Amazon Stack
Once you have created a key Pair, we will now create our Amazon Stack. 
If you are not already in the concerto document page you can click HERE to navigate to the Concerto Documentation page. 
Once on the documentation page Scroll down to the “Installation on Amazon EC2” heading and click on the “Launch ec2-basic CloudFormation Stack”.

This link will direct you to the Amazon Create Stack Page. Here we will now create out stack to dock the Concerto platform on the cloud. 
We want to keep all defaulting options for this stack so we will proceed to the next page by clicking “Next” in the bottom right hand corner.

Next we will specify the stack details. 
Under the “Stack Name” field You are allowed to use any name you so choose. In this example we will be keeping the default name.

Under the Parameter Section, we will need to fill out the “Password” field. Again, any password of your choosing will suffice

Under the Web section we will need to open the “Key Pair” Drop box and select “concerto”. 
After you will also need to fill out the password of your choosing under the Database subheading. 

Once that is all done click the “Next Button in the bottom right hand corner. 

### 2.3.4	Navigating to the Concerto URL
After “Next” has been executed you will be brought to your Amazon “Stacks” page. 
Once here, Amazon will process your stack. This process will take about 1 to 2 minutes complete. 
Once Completed you will see a green check mark with a cricle around it and a “Create_Complete” in the middle right side of your screen

Now the process has been completed, we will now navigate to the Outputs Tab on the Amazon Stack Page

Here we will find the link to the concerto platform. Click on the URL Link in the URL section.

The link will direct you to the Concerto login in page. 
Once on the login page, Enter “admin” as your username and enter the password associated with you Amazon Stack. The click “Log In”

If successful, you should be directed to a page that looks like the following:

You have now successfully docked the concerto platform. 
If there were any errors found during the configuration of this process, you may click here to trouble shoot the problem

# 3. Navigating Concerto
## 3.1	Tests
### 3.1.1 Test Attributes
### 3.1.2 Creation
### 3.1.3 Types of Tests
## 3.2	Test Wizards
### 3.2.1 Attributes of a Wizard
### 3.2.2 Creating a Wizard
## 3.3Templates
## 3.4Data Tables
### 3.4.1 Data Table Attributes
### 3.4.2 Data Table Description
### 3.4.3 Accessing the Database
## 3.5Files
## 3.6Users
## 3.7Administration

# 4. Ezekiel

# 5. Jacob

# 6. Simple CAT Test Creation

# 7. Test with Group Questions Creation

# 8. References and Tools

# 9. Acronyms

# 10. Terms and Definition

# 11. Troubleshooting
## 11.1 Key Pair could not be Found
