# bash-p2-yjx
This is project 2 from Jiaxin Ying for IDS706 class.

## Goal of Project 2
In project2, I use the same dataset Walmart.csv from project 1. The main goal is to build a Bash command-line tool that performs a useful data preparation task such as truncating data, sorting it, and cleaning data for Walmart.csv. It will help sales managers review the data and understand the factors that affect weekly sales, so they can work more efficiently.

### Steps of Building Docker in Codespace
* Build: `docker build .`
* List: `docker image ls`
* Run with my image id: `docker run -it 4ef3bb211c45 /bin/bash read.sh Walmart.csv`

### Push to DockerHub
* Create docker account at first, then create an access token, place this token in GitHub Secrets for codespaces, and name it as "DOCKER_HUB".
* Docker login: `docker login -u helenyjx -p $DOCKER_HUB`
* Build and tag locally: `docker build . -t helenyjx/project2`
* Docker push: `docker push helenyjx/project2`
* Verify I can run it by pulling from Docker Hub: https://hub.docker.com/repository/docker/helenyjx/project2

### Run in Cloud9
#### Run locally
* eg1: `docker run -it helenyjx/project2:latest /bin/bash read.sh Walmart.csv`
* eg2: `docker run -it helenyjx/project2:latest /bin/bash sort.sh Walmart.csv`
* eg3: `docker run -it helenyjx/project2:latest /bin/bash clean.sh Walmart.csv`
#### AWS Cloud9 login: 
* `aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 894437926398.dkr.ecr.us-east-2.amazonaws.com`
#### Retag and push:
* `docker tag helenyjx/project2 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest`
* `docker push 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest`
#### Verify it runs in a new cloud9 instance: 
* Read each record: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash read.sh Walmart.csv`
* Sort each record via excluding the header row: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash sort.sh Walmart.csv`
* Clean each record in organized format: `docker run -it 894437926398.dkr.ecr.us-east-2.amazonaws.com/project2-yjx:latest /bin/bash clean.sh Walmart.csv`