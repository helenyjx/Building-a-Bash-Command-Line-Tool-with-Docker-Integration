# Project2-Jiaxin-Ying
This is project 2 from Jiaxin Ying for IDS706 class.

## Key Objectives of Project
In project 2, I use the same dataset Walmart.csv from project 1. This dataset comes from Kaggle called Walmart (https://www.kaggle.com/datasets/yasserh/walmart-dataset), which is about 45 Walmart stores’ historical data that covers sales from 2010-02-05 to 2012-11-01. There are seven main variables: Date, Weekly_Sales, Fuel_Price, CPI, Temperature, Holiday_Flag and Unemployment rate.
The main goal is to build a Bash command-line tool that performs a useful data preparation task such as truncating data, sorting it, and cleaning data for Walmart.csv. It will help sales managers review the data from an organized format and check the factors that potentially affect weekly sales, so they can work more efficiently.

## Structure Diagram
<img width="882" alt="Screen Shot 2022-10-02 at 7 13 19 PM" src="https://user-images.githubusercontent.com/112274822/193480531-b5a5799b-333a-4c7f-94b4-7a15c1cb047b.png">

## Demo Video Link

## Advance Preparation
#### 1. Build virtual environment
A virtual environment is a tool that helps to keep dependencies required by different projects separate by creating isolated python virtual environments for them. However, in this project we only use bash command-line tool without python language, so this step is optional.
* Hold keyboards: Shift+Command+P, search: "devcon", and then click the first option. 
<img width="689" alt="denv" src="https://user-images.githubusercontent.com/112274822/193478067-55a9fb6b-3e3b-4ed8-b988-03c8b134f77f.png">

* Find "Python 3", and then also click the first option.
<img width="532" alt="Screen Shot 2022-10-02 at 6 03 26 PM" src="https://user-images.githubusercontent.com/112274822/193478297-57596596-0c2e-4452-847d-d25a6c6c8ec3.png">
<img width="519" alt="Screen Shot 2022-10-02 at 6 03 11 PM" src="https://user-images.githubusercontent.com/112274822/193478306-388feeca-5fc9-4ee9-a45f-5c29321cf13d.png">

* Once finish above steps, you will see the new file called "devcontainer.json". Also, you can check wether (.venv) shows in the Terminal.
<img width="1047" alt="Screen Shot 2022-10-02 at 5 29 42 PM" src="https://user-images.githubusercontent.com/112274822/193478113-ba76caac-60fa-41b4-bf6e-2a4ea2409662.png">

#### 2. Create a new workflow at Github
A workflow is a configurable automated process that will run one or more jobs. Workflows are defined by a YAML file checked in to your repository and will run when triggered by an event in your repository, or they can be triggered manually, or at a defined schedule.
* Go to the homepage of the repository, cilck the button "Actions", choose "set up a workflow yourself".
<img width="1167" alt="Screen Shot 2022-10-02 at 5 36 06 PM" src="https://user-images.githubusercontent.com/112274822/193478123-cc0ccb4d-bd4f-4928-b62b-d90bef69ca31.png">

* Name it as "main.yml", type the code you need, then click the green button "start commit".
<img width="1440" alt="Screen Shot 2022-10-02 at 5 59 32 PM" src="https://user-images.githubusercontent.com/112274822/193478170-e31c0690-0209-4d87-bdba-6a5806d142cb.png">

* Once complete these steps, you can check the status of your workflows from "Actions" page, so that make sure your program could pass the tests. Otherwise, you need to fix the code where the bugs/errors arw reported.
<img width="1333" alt="Screen Shot 2022-10-02 at 5 30 33 PM" src="https://user-images.githubusercontent.com/112274822/193478177-cb07a2bc-ff65-4172-8174-15cc74c75af3.png">

#### 3. Create a Makefile
A makefile is a special file that lists a set of rules for compiling a project. These rules include targets, which can be an action make needs to take (eg. "clean" or "build") or the files/objects make will need to build, and the commands that need to be run in order to build that target. 
* Type: `touch Makefile`
* Once Makefile is built, add the code you need. When you call the program make, it runs through each of these targets in your Makefile and executes them.
<img width="402" alt="Screen Shot 2022-10-02 at 5 46 10 PM" src="https://user-images.githubusercontent.com/112274822/193478190-7caefd3b-3b60-4bbd-afcc-5e93622bacc4.png">

#### 4. Add requirements.txt
Requirement. txt file is a type of file that usually stores information about all the libraries, modules, and packages in itself that are used while developing a particular project. It also stores all files and packages on which that project is dependent or requires to run. 
* Because this file is automatically by the system, we can add any files and packages directly for the project.

### Steps of Building Docker in Codespace
#### 1. Build: 
Type: `docker build .`

<img width="892" alt="dockerbuild" src="https://user-images.githubusercontent.com/112274822/193355483-fbab1c71-21d6-4a8e-9624-dc614eb3890c.png">

#### 2. List: 
Type: `docker image ls`

<img width="526" alt="dockerimage" src="https://user-images.githubusercontent.com/112274822/193355543-6a2747b1-61a2-4ff5-a7e3-1ed827628d83.png">

#### 3. Run with my image id: 
* Using the read command to read the line-break (\n) separated records of dataset: `docker run -it 4ef3bb211c45 /bin/bash read.sh Walmart.csv`
<img width="787" alt="read" src="https://user-images.githubusercontent.com/112274822/193356930-c844a050-dc8d-4e34-b613-286807935414.png">

* Sorting the record after excluding the header line from the output: `docker run -it 4ef3bb211c45 /bin/bash sort.sh Walmart.csv`
<img width="797" alt="sort" src="https://user-images.githubusercontent.com/112274822/193356966-f8c0bd00-df48-43ba-ac1b-7996355766c9.png">

* Cleaning the data from stores 1 to 45, to show each record in orginized format: `docker run -it 4ef3bb211c45 /bin/bash clean.sh Walmart.csv`
<img width="801" alt="clean" src="https://user-images.githubusercontent.com/112274822/193357015-6c238813-22a2-4b79-857e-b1b1a66829a7.png">
<img width="617" alt="clean2" src="https://user-images.githubusercontent.com/112274822/193357158-81415cda-db4b-43c0-ba0c-52503e2f9728.png">

### Push code to DockerHub
* Create docker account at first, then create an access token from account setting. 
<img width="1290" alt="token" src="https://user-images.githubusercontent.com/112274822/193355854-303e5c6f-3154-40dc-9526-8e923e5bdd15.png">

* Place this token in GitHub Secrets for codespaces, and name it as "DOCKER_HUB".
<img width="1121" alt="token2" src="https://user-images.githubusercontent.com/112274822/193355989-abdc9300-0167-427d-a953-3e5fca8698c6.png">

* Docker login: `docker login -u helenyjx -p $DOCKER_HUB`
<img width="675" alt="dockerlogin" src="https://user-images.githubusercontent.com/112274822/193356048-b7df2aee-10d1-4d8d-ab46-dd1d36f8c0ef.png">

* Build and tag locally: `docker build . -t helenyjx/project2`
<img width="903" alt="dockerbuildpush" src="https://user-images.githubusercontent.com/112274822/193356104-1fbdfddb-131c-4795-a8aa-d650ffcb2e94.png">

* Docker push: `docker push helenyjx/project2`
<img width="771" alt="dockerpull" src="https://user-images.githubusercontent.com/112274822/193356326-67f6f9d1-c967-4c35-ba77-c2ab85b65f8e.png">

* Verify I can run it by pulling from Docker Hub: https://hub.docker.com/repository/docker/helenyjx/project2

### Run in Cloud9
#### 1. Create a new AWS account
* Sign in: 
<img width="975" alt="Screen Shot 2022-10-02 at 11 08 16 PM" src="https://user-images.githubusercontent.com/112274822/193495073-a15a87fd-8653-4619-b9f8-e7bf55a10073.png">

* Find Cloud9:
It is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It combines the rich code editing features of an IDE such as code completion, hinting, and step-through debugging, with access to a full Linux server for running and storing code.
<img width="889" alt="Screen Shot 2022-10-02 at 11 09 08 PM" src="https://user-images.githubusercontent.com/112274822/193495200-61384bfd-11b9-40c1-9053-927b1580e940.png">


* Create environment:
<img width="1424" alt="Screen Shot 2022-10-02 at 11 20 38 PM" src="https://user-images.githubusercontent.com/112274822/193495856-5f851e97-10c2-48f2-b505-ea24bd756992.png">
<img width="916" alt="Screen Shot 2022-10-02 at 11 19 55 PM" src="https://user-images.githubusercontent.com/112274822/193495936-40e8178e-5ca2-4528-ac25-4c85a8798320.png">

#### 2. Run code locally:
* eg1: `docker run -it helenyjx/project2:latest /bin/bash read.sh Walmart.csv`
* eg2: `docker run -it helenyjx/project2:latest /bin/bash sort.sh Walmart.csv`
* eg3: `docker run -it helenyjx/project2:latest /bin/bash clean.sh Walmart.csv`

#### 3. Create a new repositpry in ECR:
<img width="439" alt="ecr" src="https://user-images.githubusercontent.com/112274822/193358214-5d9ec494-cb65-40a9-bfcc-5c56eb312537.png">

#### 4. AWS Cloud9 login: 
* Find the AWS CLI from Amazon Elastic Container Registry, click "View push commands" from image. Then, copy the first address, it is used for retrieving an authentication token and authenticate my Docker client to my registry.
<img width="1450" alt="ecr link" src="https://user-images.githubusercontent.com/112274822/193358615-7ddd0ebb-553c-49ea-9a60-11a6d4953726.png">
<img width="785" alt="copy ecr" src="https://user-images.githubusercontent.com/112274822/193358901-14a82a85-a6e7-4186-8452-adeae77e2716.png">

* Preparing to login: `aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 894437926398.dkr.ecr.us-east-2.amazonaws.com`
<img width="1184" alt="docker log" src="https://user-images.githubusercontent.com/112274822/193357820-1d5f8654-2036-442c-883a-8d8c70d952bb.png">

#### 5. Retag and push:
* Type: `docker tag helenyjx/project2 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest`
* Type: `docker push 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest`
<img width="1000" alt="docker push tag run" src="https://user-images.githubusercontent.com/112274822/193357758-64fa379c-8cbf-4aa8-ba3a-975be9ffb636.png">

#### 6. Verify my project could run in a new cloud9 instance: 
* Read each record: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash read.sh Walmart.csv`
<img width="682" alt="Screen Shot 2022-10-02 at 11 40 25 PM" src="https://user-images.githubusercontent.com/112274822/193497771-52b3bf33-4254-477a-90e3-b3ede58fa0ac.png">

* Sort each record via excluding the header row: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash sort.sh Walmart.csv`
<img width="992" alt="clean veryfiy" src="https://user-images.githubusercontent.com/112274822/193357603-bb044ace-ce12-4390-922a-5b13f8c7601e.png">

* Clean each record in organized format: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash clean.sh Walmart.csv`
<img width="283" alt="veryfiy" src="https://user-images.githubusercontent.com/112274822/193357659-a261301f-1e9f-4495-89d6-e2361341d308.png">
