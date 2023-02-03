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
This section will provide the necessary information to equip users to navigate the Concerto platform. The Concerto platform consists of 7 tabs, and this section will break down each individual tab and its functionality. 

## 3.1	Tests
### 3.1.1 Test Attributes
Base Properties <!-- make this bold-->
- Accessibility – Describes who can view and edit an object in the administration panel. This can be one of the following:
  - private – Can only be accessed by owner of the object, or super admins.
  - group – Can be accessed by owner, users belonging to the same group as the object, or super admins.
  - public – Can be accessed by anyone logged in to the administration panel.
- Archived – Archived objects will not be selectable from test wizard parameters.
- Description – Text describing the purpose of the object. This is visible as contextual information when using this object.
- Groups – Groups that this object belongs to. Used in conjunction with Accessibility.
- Name – Unique, human readable identifier, that will be used to reference the test in your test logic.
- Owner – Object owner. Used in conjunction with Accessibility.
- Type – Describes the type of logic used. This can be one of the following:
  - code – the test logic is comprised of plain R code.
  - wizard – the test logic is determined by a test wizard. Wizards can be used to override the default values of test parameters.
  - flow – Test logic is scripted visually using the flow chart.
- URL name – Unique string that will be used in URL to launch this test.
- Visibility – Defines if and from where this test can be run. This can be one of the following:
  - regular – Can be launched directly from URL.
  - subtest – Can only be run from within another test, and cannot be launched directly from URL
  - featured – Can be launched directly from URL and will also be listed in ‘available tests’ dropdown on the main domain where you have Concerto platform installed.
Test Inputs <!-- make bold -->
Input parameters can be passed to a Concerto test and used in test logic. The test input section is not available for wizard-based tests. Each input parameter consists of the following properties:
- Name – Identifier that will be used to reference the input parameter.
- Description – Text describing the purpose of the input parameter.
- URL – If checked, it means that this input parameter value can be set through the URL (using a URL parameter with same name). If unchecked, it will not allow this parameter to be set through the URL. This only applies for for tests that can be launched directly through the URL and not to sub-tests.
- Default value – Default string value to use for this parameter when no value has been specified. Defaults to NA.


### 3.1.2 Creation
Tests are the bread and butter of Concerto and the implementation of such is easy. 
Select the “Tests” tab and click on the “User made” tab. 

Finally, click on “Add new” and a window will pop up showing different options:
 
Click on “save” and navigate towards your newly created test, it should be now presented on the window. Click on ‘edit’ to start working on your test.

### 3.1.3 Types of Tests
Code-based tests

Code based tests are purely R and will execute when the test is called in other programs. 
Input parameters can be accessed directly in test logic code.  If you have functions that are used frequently, you can implement them in code form and then call on them when coding in a flowchart-based test.

Wizard-based tests

A wizard can be viewed as the “front paneling” of a test and needs a source test to function. Wizards function as the GUI for your tests to make them more user friendly when implementing them in flowchart-based tests. Input/output parameters will be designated and can be organized with a wizard. This can be easily shown in the “tests” tab, just click on the “Starter content” tab to see what the original developers have created. 
 
The test “_eval” is the source test while “eval” is the test wizard.
 
As a sidenote, while you cannot edit the starter content, you can still view it; there are some great examples of how to manipulate Concerto and do some tricks that the original documentation does not cover. 

Flowchart-based tests

The most used test in Concerto and how you will develop your largest tests. As the name suggests, tests are created using block code in a flowchart style. Initially, you will only see two blocks: “test start" and “test end” with yellow square nodes. You can drag these nodes around and if you click and hold on the yellow square on the “test start” you can drag this to the other square node on “test end.”
  
This yellow line shows how the program will be executed, if you have ever used Lego Mindstorms before, then this should look familiar. This test will not do anything, if you click on the blue button “Run test” then you should see another tab open on your browser with text saying: “Test finished.” You can close this extra tab for now and we will add another node to our test. Right click anywhere on the test space and a new little window will open. 
 
Click on “eval” and a new node will be placed on the testing. A window for eval will also pop-up and if you click on the three bars, you can implement your own R code into the flow chart. 
 
Make sure to press save twice, once after typing out your code and secondly with the original eval window. You can then connect all three nodes together and you can run the code within the eval block. 

As a sidenote: Print and the like in R code will not show up on the page. To have actual pages that have graphics use the “ShowPage” block. The only way to see data encapsulated by the print function is to click on “debug test” and press f12 to inspect what has been printed in the logs.
 
There are several other features included with flowchart-based tests which will be explained further in “Simple CAT Test Creation.”  

## 3.2	Test Wizards
### 3.2.1 Attributes of a Wizard
As previously written above, a wizard is a layer that can be placed on top of any test with input parameters defined, if you have a test that you want to implement in other tests however there are dynamic variables that you need to be passed through, then you can use a wizard to streamline that process. 

As a sidenote: When placing these created tests in future flowcharts, call on the wizard not on the source code

Base Properties <!-- make bold -->
- Accessibility 
  - private – Can only be accessed by owner of the object, or super admins.
  -	group – Can be accessed by owner, users belonging to the same group as the object, or super admins.
  - public – Can be accessed by anyone logged in to the administration panel.
-	Archived – Archived objects will not be selectable from test wizard parameters.
-	Description – Text describing the purpose of the object. This is visible as contextual information when using this object.
-	Groups – Groups that this object belongs to. Used in conjunction with Accessibility.
-	Name – Unique, human readable identifier, that will be used to reference the test in your test logic.
-	Test – Specifies the source test for which you are making a wizard.
-	Owner – Object owner. Used in conjunction with Accessibility.

Test Wizard Steps

Used to group test wizard parameters into thematic sections. Each step is described by the following properties:
- Title – Step title, that will be visible as a tab name for that step or group of steps in the wizard.
-	Description – Description or instructions that will be visible to users while on a given step in the wizard.
-	Order – Order index of the wizard step. These values are used to sort the steps in the test wizard.

Test Wizard Parameters

These allow the user to define more complex methods, or extensions, for editing the input parameter values of the source test. Each test wizard parameter is described by the following properties:
-	Step – The test wizard step that this parameter relates to. Each test wizard parameter needs to be attached to a single step.
-	Test variable – The input parameter in the source test of which this test wizard parameter is an extension.
-	Label – Text label of wizard parameter that will be visible in the test wizard.
-	Type – The type of editing method that this wizard parameter will perform on the source test variable. This can be one of the following
-  
  -	Checkbox
  -	Data table
  -	Data table column
  -	Data table column map
  -	Drop-down list
  -	Group
  -	HTML
  -	List
  -	Multi-line text
  -	R code
  -	Single-line text
  -	Test
  -	Test wizard
  -	View template
-	Hide condition – Used to hide parameter editor depending on values of other parameters. E.g.:
values.showOptions == 0

for hiding parameter when showOptions parameter (checkbox) is unchecked.
-	Definition – More detailed definition of a wizard parameter. The value of this property depends on the Type of parameter you are working with e.g. default value, group fields, drop-down list options, etc.
-	Passable through URL – Override for URL flag of input parameter.
-	Order – Parameters will be sorted by this value inside their parent step.

### 3.2.2 Creating a Wizard
The first step of creating a wizard is by implementing input parameters in a test. I have a little test made so that it will present a number, a string, and a character. I just modified the html in a “show page” node.
 
I have input ports on the node itself with default values set.  
 
Now, we want the test to have some “ports” open so that the wizard can recognize them and implement them in the GUI. This means we have to create some external inputs for our test. Scrolling upwards, you will find “Test input.” Click on “Add input parameter” and give a label to the input parameter.	
Do this twice more and you will notice that on the “test start” node some new ports have shown up on it. Connect the newly made input parameters to their perspective variables and save the test. 
Under the “Test wizards” tab, click on “Add new” and give your wizard a name. Under “test” find the test you have been working on. 
 
Underneath “Test wizard steps” click on “add new step” and give the step a title. 
 
Underneath this tab, go to “Test wizard params” and click “add new param.” Select your newly made wizard step, select one of the params we created earlier, and add a label. 
   
Do this for each of the parameters we made a while ago and save this wizard. Finally, we go back to the “tests” tab and create a new test. Make sure the test type is wizard and select the wizard you just created. Give this new “test” a name and you have made a simple wizard! 
  
As you can see with this new test with the new wizard included, I can add my own variables into the node and it will show my dynamic variables on the page. 

## 3.3Templates
## 3.4Data Tables
### 3.4.1 Data Table Attributes

Base Properties
- Accessibility – Describes who can view and edit an object in the administration panel. This can be one of the following:
  -	private – Can only be accessed by owner of the object, or super admins.
  -	group – Can be accessed by owner, users belonging to the same group as the object, or super admins.
  -	public – Can be accessed by anyone logged in to the administration panel.
-	Archived – Archived objects will not be selectable from test wizard parameters.
-	Description – Text describing the purpose of the object. This is visible as contextual information when using this object.
-	Groups – Groups that this object belongs to. Used in conjunction with Accessibility.
-	Name – Unique, human readable identifier, that will be used to reference the data table.
-	Owner – Object owner. Used in conjunction with Accessibility.

Data Table Structure
List of the columns in your table. Each column is defined by the following properties:
-	Name – Unique identifier that will be used to address a column.
-	Type – Data type of a column. This can be one of the following:
  -	boolean
  -	bigint
  -	date
  -	datetime
  -	decimal
  -	float
  -	integer
  -	smallint
  -	string
  -	text

All tables must have an id column with the type bigint. This value will be auto-generated when a new record (row) is inserted into the table. The column is added automatically on table creation and cannot be edited or removed.

### 3.4.2 Data Table Description
Data tables are how you are going to store everything for future reference. That includes question data and what results you got from students taking tests. It is imperative that you keep good database design in min when creating such tables. All the information stored is within a MySQL database and there are several ways to access it. 

### 3.4.3 Accessing the Database
There are two ways to access data tables within a test, using the “dataManipulation” node or using R code. 

Using the dataManipulation node
Within a flowchart, you can create a “dataManipulation” node that has several inputs and one output. The node will help you structure a MySQL query that will ping your data tables 
 
## 3.5Files
## 3.6Users
## 3.7Administration

# 4. Ezekiel
Z-SCORE
When calling test results from a data table in concerto, the r code creates a dataframe from the information gathered in the code below we take the ‘value’ data from the ‘ShiftOne’ data table using query commands nested in r code. The type ‘tableAVG’ becomes a n x 1 array like structure where n is the number of rows and we only get 1 column.
tableAVG = concerto.table.query('SELECT AVG(Value) from ShiftOne')
Once this information is generated we then apply the formula below:

itr = 1
variance = 0
for (integer in tabular_copy1[['Value']]) {
  # subtract the avg from each value in the dataframe
  #integer = integer - tableAVG
  #dataframe[row, col]
  tabular_copy1[itr,1] <- integer - tableAVG
  # square the result
  tabular_copy1[itr,1] <- tabular_copy1[itr,1] * tabular_copy1[itr,1]
  variance = variance + tabular_copy1[itr,1]
  itr = itr + 1
}
variance = variance / countSize[1,1]
 to get the std deviation, just take the square root of variance
stdDeviation = sqrt(variance)

For programmers, notice that the data frame is not 0-indexed, you need to start checking values from the 1st location rather than the 0th. Next you should see that we square a precalculated average to subtract each integer then square the result. These collective results are then added up, then divided by the amount of values in total to get variance, to get standard deviation you must take the square root of the variance.

The next segment of code reveals how to turn standard deviation into a z-score for normalizing test results.

itr = 1
print(tabular_copy2)
for (integer in tabular_copy2[['Value']]) {
	tabular_copy2[itr, 1] <- ((tabular_copy2[itr,1] - tableAVG) / stdDeviation)
  	itr = itr + 1
}

For loops in R don’t come with a built-in function to auto increment all values in the header, some must be manually coded, notice the final line inside the loop. Each value inside the dataframe labeled ‘tabular_copy2’ is subtracted by the avg value then the result is divided by standard deviation.

DISPLAYING THE INFORMATION

Now that we have a dataframe that has the z-scores, we need to display this information to a web page for a professor or other educator to see.

Before building a web page, you should realize that the Concerto system runs on blocked/segmented coding to run a ‘test’. Reference the image below, the node sequentially after ‘test start’ is the ‘eval’ block that contains the R code. The next block after is the ‘showPage’ where we write html to display a webpage. You should be able to notice that there are multiple thin lines connecting by red and blue spheres between ‘eval’ and ‘showPage’. These lines, or ports, are how we pass data from R code to html.
 
If you refer back to the R code, shown below, you will notice that there is a string literal named ‘htmlStrTwo’. The string is formatted to look like html code. Inside the for loop, the program is concatenating data from the data frame to the string along with appropriate html table code. To pass ‘htmlStrTwo’ from the ‘eval’ node to the ‘showPage’ node the name on the output port must match the name of the string literal, the input port on ‘showPage’ doesn’t need to match the connected port in name, but it makes following code easier.

htmlStrTwo = '<table style="border-style: double"> 
	<tr> <th>Original</th> <th>Z score</th> </tr>'

itr = 1
for (integer in tabular_copy2[['Value']]) {
	# print(integer * 10)
 	htmlStrTwo = paste(htmlStrTwo, '<tr> <td>', tabular[itr, 1],'</td> <td>', integer,'</td> </tr>') 
  	itr = itr + 1
}

itr = 1
	
Once the data is connected to the ‘showPage’ node you can display it using a special syntax. Highlighted in the image below is information that we want to display. The input port, shown on the previous image, must match the name as the variable used in the html environment.
 
The next image shows a webpage generated by concerto with the results for the test scores and z-scores formatted into a two column table.
 
# 5. Jacob

# 6. Simple CAT Test Creation

# 7. Test with Group Questions Creation

# 8. References and Tools

# 9. Acronyms

# 10. Terms and Definition

# 11. Troubleshooting
## 11.1 Key Pair could not be Found
