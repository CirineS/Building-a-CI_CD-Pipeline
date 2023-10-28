Github Actions Build Status
Overview
In this project, I've created a GitHub repository from scratch and set up a scaffolding that enables both Continuous Integration and Continuous Delivery. I've leveraged GitHub Actions along with a Makefile, requirements.txt, and application code to automate the initial linting, testing, and installation cycle. Additionally, I've integrated this project with Azure Pipelines to enable Continuous Delivery to Azure App Service. As part of this project, a pre-trained scikit-learn model is provided to predict housing prices in Boston based on various features, such as average rooms in a home.

Project Plan
Here's the link to the Trello board for project management: Trello Board Link

You can find project estimates in this spreadsheet: Azure CI_CD Pipeline Project Estimates1.xlsx

Instructions
Architectural Diagram
Architectural Diagram

The diagram illustrates the sequence of steps in the project's construction. Code is pushed to a remote repository provider, in this case, GitHub, which triggers the pipeline on a "push" event. Software building involves multiple steps, including installing dependencies, linting, testing, and code compilation, which are all automated using a Makefile. Continuous Integration requires a build server, a centralized machine dedicated to continuously building the project whenever code is committed. GitHub Actions is used as the build server, and its integration with GitHub allows automatic builds upon code commits.

In the Continuous Delivery step, the GitHub repository is linked with Azure Pipelines (a cloud-native build server) to generate the build package after a successful build. This pipeline connects to a predefined Azure web app to deploy and update the code. Verification of a successful deployment is done by making a POST request, passing input parameters in JSON, and receiving a prediction response. A shell script sends input data to the application via the appropriate port. Each numerical value represents a feature crucial for determining Boston house prices. The source code passes this data through a pre-trained machine learning model and returns a predicted house price.

Create the Cloud-Based Development Environment and Successfully Clone the Project into Azure Cloud Shell
In this diagram, Azure Cloud Shell is used to create an empty scaffold with tests, source code, a Makefile, and requirements.

Azure Cloud Shell

Launch an Azure Cloud Shell environment and integrate GitHub repository communication. In the first step, code on GitHub is cloned into the Azure Cloud Shell environment, and the web app is run in the Azure Cloud Shell environment.

Integration with Azure Cloud Shell

Local Test
A Makefile provides shortcuts for building, testing, and deploying a project. Below are the passing tests displayed after running the make all command from the Makefile.

Local Tests

Local Tests on Azure Cloud Shell

CI: Configure GitHub Actions
Configure GitHub Actions to test the project on GitHub code change events. This is a necessary step for remote Continuous Integration.

Configuring a SaaS build server like GitHub Actions is an essential practice for any software project aiming to implement DevOps. This completes the Continuous Integration phase and paves the way for Continuous Delivery.

This diagram shows how code can be automatically tested by enabling GitHub Actions. A push change to GitHub triggers the GitHub Actions container, which runs a series of commands.

GitHub Actions for Automated Testing

Below is a screenshot of remote code testing and the finalized Continuous Integration through GitHub Actions.

GitHub Actions Workflow

Continuous Delivery on Azure
This diagram demonstrates the continuous delivery of a Flask application using Azure Pipelines and Azure App Service.

Continuous Delivery with Azure Pipelines

Successful Prediction from Deployed Flask App in Azure Cloud Shell
The Flask app can be manually deployed on Azure App Service by running the command. The app can then be tested in the Azure Cloud Shell environment by running make_predict_azure_app.sh.

bash
Copy code
az webapp up --name mywebapp10021990 --resource-group azuredevops --runtime "PYTHON:3.7"
bash make_predict_azure_app.sh
Successful Prediction

Successful Project Deployment in Azure Pipelines
Azure Pipelines Deployment

Application Running Against a Load Test with Locust
The Makefile has a load-test step that runs when make all is called, using Locust to perform load testing on web apps in headless mode. The command is as follows:

bash
Copy code
locust -f locustfile.py --headless -u 10 -r 1 -H http://localhost:5000 -t 50s --check-fail-ratio 0.08 --only-summary
After finishing the load test, Locust displays summary statistics.

Locust Load Test

The GitHub Actions pipeline run output is displayed below.

GitHub Actions Pipeline

GitHub Actions Pipeline - Successful Deployment

Azure Web App Screenshot
Azure Web App

Azure App Service Screenshot
Azure App Service

Output of Streamed Log Files from Deployed Application - Streamed Log Files
Streamed Log Files

CD with Azure Pipelines After Making Changes in app.py
Continuous Delivery with Azure Pipelines

Enhancements
Direct deployment from GitHub Actions to Azure Web App Service.
Adding more test cases to improve the application.
Creating a UI for making predictions.
Demo
You can watch a demo of the project on YouTube: Demo