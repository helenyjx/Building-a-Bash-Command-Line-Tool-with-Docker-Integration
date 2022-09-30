# bash-p2-yjx
This is project 2 from Jiaxin Ying for IDS706 class.

## Key Objectives of Project
In project 2, I use the same dataset Walmart.csv from project 1.  I chose this dataset from Kaggle called Walmart (https://www.kaggle.com/datasets/yasserh/walmart-dataset), which is about 45 Walmart stores’ historical data that covers sales from 2010-02-05 to 2012-11-01. There are seven main variables: Date, Weekly_Sales, Fuel_Price, CPI, Temperature, Holiday_Flag and Unemployment rate.
The main goal is to build a Bash command-line tool that performs a useful data preparation task such as truncating data, sorting it, and cleaning data for Walmart.csv. It will help sales managers review the data and understand the factors that affect weekly sales, so they can work more efficiently.

## Structure Diagram

## Demo Video Link

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
#### Run locally
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
<img width="502" alt="read veryfiy" src="https://user-images.githubusercontent.com/112274822/193357467-783fe79d-6ca7-4de8-b9e1-8c290e39454a.png">

* Sort each record via excluding the header row: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash sort.sh Walmart.csv`
<img width="992" alt="clean veryfiy" src="https://user-images.githubusercontent.com/112274822/193357603-bb044ace-ce12-4390-922a-5b13f8c7601e.png">

* Clean each record in organized format: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash clean.sh Walmart.csv`
<img width="283" alt="veryfiy" src="https://user-images.githubusercontent.com/112274822/193357659-a261301f-1e9f-4495-89d6-e2361341d308.png">
