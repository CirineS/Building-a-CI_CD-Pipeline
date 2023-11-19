[![Build Python app - mywebapp345678](https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/actions/workflows/pythonapp.yml/badge.svg)](https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/actions/workflows/pythonapp.yml)

# Overview

In this project, I've created a GitHub repository from scratch and set up a scaffolding that enables both Continuous Integration and Continuous Delivery. I've leveraged GitHub Actions along with a Makefile, requirements.txt, and application code to automate the initial linting, testing, and installation cycle. Additionally, I've integrated this project with Azure Pipelines to enable Continuous Delivery to Azure App Service. As part of this project, a pre-trained scikit-learn model is provided to predict housing prices in Boston based on various features, such as average rooms in a home. Here are the [starter_files](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/tree/master/C2-AgileDevelopmentwithAzure/project/starter_files).


## Project Plan
Here's the link to the Trello board for project management: [Trello Board Link](https://trello.com/b/q4Nh5SnY/building-a-ci-cd-pipeline)

You can find project estimates in this spreadsheet: [project-management-template.xlsx](https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/files/13309455/project-management-template.xlsx)
![image](https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/fdb88763-1da7-45d1-ae4f-0da22176876b)



## Instructions

![architectural diagram](https://user-images.githubusercontent.com/97893144/192469299-7bf7f2a8-ada1-400d-bc3a-0d187dfedc9e.png)

This is the architectural diagram illustrarting the sequence of steps in the project's construction. Code is pushed to a remote repository provider, in this case, GitHub, which triggers the pipeline on a "push" event. Software building involves multiple steps, including installing dependencies, linting, testing, and code compilation, which are all automated using a Makefile. Continuous Integration requires a build server, a centralized machine dedicated to continuously building the project whenever code is committed. GitHub Actions is used as the build server, and its integration with GitHub allows automatic builds upon code commits.

In the Continuous Delivery step, the GitHub repository connects to Azure Pipelines, a cloud build server. After a successful build, the pipeline deploys the code to an Azure web app. To verify success, it sends a POST request with JSON input, receiving a prediction. A shell script passes input data through a pre-trained model, predicting Boston house prices using essential features.

* **Create the Cloud-Based Development Environment and succesfully clone the project into Azure cloud shell**

Launch an Azure Cloud Shell environment and integrate Github repository communication. In the first step, code in GitHub is cloned into the Azure cloud shell environment, and the webapp is run in the Azure Cloud Shell environment.
  <img width="649" alt="Project_cloned" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/22dcb164-a87c-45d4-a40f-316fe2f1e9da">

  
* **Local Test**
  
A Makefile is a handy way to create shortcuts to build, test, and deploy a project.

Below are the passing tests that displays after running the make all command from the Makefile <br>
<img width="951" alt="passing_tests_100" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/a3d154ef-fd02-4cd8-a33e-8487644336f1">


* **Passing tests in Github Actions**
<img width="658" alt="passing_Github_Actions_Build" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/0cbc8d11-76ab-4252-8c00-a6f43b72b7f1">
<br>


* **Successful prediction from deployed flask app in Azure Cloud Shell**
  *  in Port 5000:
  <img width="714" alt="make prediction exec" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/22efb396-f159-429b-b15b-3954f7db1d53">
  
  *  and in Port 443:
  <img width="737" alt="exec make predict" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/9ac4211d-f8fe-40f9-b0bb-de167c65664e">


* **Locust test**
  
  ![run locust](https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/49d021a7-dd64-4a35-9f6e-03949cb00c10)

  By creating some tests using locust and running them in the command line; this will run the locust file. You can see the results below in the localhost 8089:
  <img width="960" alt="pantallazo_locust" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/32bf3ef0-9926-41ad-8c31-84f8a927b5de">

  <img width="942" alt="Capture charts" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/0ec1bdf0-2fe7-4c41-80a4-94b38eab1859">


* **Creating a pipeline**
  
To create a pipeline, first we need to create an agent.
In Project Settings, under Pipelines, click on agent pools, then on agents, click on New agent, and follow the wizard.
Configure the agent in the Azure CLI, run it using ./run.sh It will build and deploy the job.

<img width="542" alt="build   deploy succeeded on azure CLI" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/4fcf36a0-d9d3-428a-bb79-af29c6792acf">


Once, done, we're now able to create the pipeline. Under pipelines, you click on New Pipeline, and give the name of the repo. Follow the Wizard to connect it to the github repo.


This screenshot is the build job running successfully:

<img width="960" alt="build ok" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/c11d9e2e-9a25-4275-a17c-b03024f40032">

This screenshot is the deployment job running successfully:

<img width="960" alt="deployment succeeded" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/b4889727-f179-4f04-bf2c-0275198332c1">

We can also launch the app in the browser

<img width="578" alt="app link" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/2e845600-5e81-4fd1-9bbe-7a5306ce2da1">

To inspect the logs from your running application, browse https://<app-name>.scm.azurewebsites.net/api/logs/docker

<img width="834" alt="Output of streamed log files from deployed application" src="https://github.com/CirineS/Building-a-CI_CD-Pipeline-Project/assets/142796680/1da2c538-5373-48fa-97bc-eb929d7de6c8">


## Enhancements
  The possible enhancements that could add value to this project could be:<br>
1- Automated Testing: Implement more comprehensive automated testing, including unit tests, integration tests, and end-to-end tests to ensure code reliability and quality.<br>
2- User Interface: Create a user-friendly web interface for users to interact with the application, input data, and receive predictions.<br>
3- Scalability: Design the application to be scalable, allowing it to handle increased user load and larger datasets efficiently...<br>

# Demo
