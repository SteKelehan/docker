# run file

docker run \    # telling docker to run
    --rm \      # Once the container is finished running shut down
    -v $(pwd):/scr \    # This flag is volume -> mount the current working dir to source in the container shows where file is
    python:3 \          # start the container with python 3
    python /scr/file.py # Run the file

# If the container does not have python 3 it will go to docker and get what it needs and add it to the image
# When this docker image is run again this will aready be there and will just run the file

# docker containers are envirments can have one for SQL, python, node etc. Each with exactly what they need to run the images


docker run \    
    --rm \      
    -it \
    -v $(pwd):/scr \    
    python:3 \          
    python  or /bin/bash

# adding the it flag allows the container to be intractive so you can run bash or python etc

#################

# This is used when you have a docker file

docker build \
    -t python_numpy \   # This is just applying the -t (tag) python_numpy to thsi docker iamge
    .                   # The dot will just look for a Docker file in the current dir



docker image ls         # Gives you and ls of what images you have


# if you want to run the python file (file.py) on a different images

docker run \    
    --rm \      
    -it \
    -v $(pwd):/scr python_numpy \    # This would then run on another docker image python_numpy
    python:3 \          
    python  or /bin/bash



# using a docker to set host a startic website

docker run \
    --rm
    -v $(pwd):/usr/share/nginx/html \   # show it the html file
    -p 8080:80 \                        # open it on local host through port 80
    nginx:lastest                       # This will keep running untill you tell it to stop
# if you add teh flag -d it will run the container in the dockground


docker container ls                     # This tells you what containers are running

docker exec -it $name_of_container $comand      #intract with a container that is running in the background

# example

docekr exec -it python_numpy /bin/bash          # bring you to bash


# Docker Networds

# containers that talk to one another - share a DNS

# create the network
docker network create multiple

# Container for MySQL
docker run \    
    --rm \      
    -d \
    --net multiple \
    --name mul_mysql
    -e MySQL_ROOT_PASSWORD='root' \
    mysql:5.6

# Container for node.js and open it to terminal
docker run \    
    --rm \      
    -it \
    --net multiple \
    --name mul_node \
    node:8 \
    /bin/bash



