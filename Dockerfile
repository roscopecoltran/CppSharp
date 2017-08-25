###########################################################################
#                                                                 		  
#  Build the image:                                               		  
#    docker build -t cppsharp --no-cache . 	                                
#                                                                 		  
#  Run the container:                                             		  
#   docker run -ti --rm -v $(pwd):/data cppsharp                                              	  		  
#                                                                 		  
###########################################################################

# Credit: https://github.com/jessfraz/dockerfiles/blob/master/gitsome/Dockerfile
FROM alpine:3.6
LABEL maintainer "Luc Michalski <michalski.luc@gmail.com>"

ARG DOCKER_USER=${DOCKER_USER:-"sniperkit"}
ARG DOCKER_USER_GID=${DOCKER_USER_GID:-"1000"}
ARG DOCKER_USER_UID=${DOCKER_USER_UID:-"1000"}

ENV DOCKER_USER_HOME=/home/$DOCKER_USER \
    HOME=$DOCKER_USER_HOME

RUN \
    adduser \
        -h $DOCKER_USER_HOME \
        -u $DOCKER_USER_GID \
        -s /usr/sbin/nologin \
        -D \
        $DOCKER_USER \
    && apk add --no-cache \
        bash \
        git \
        gnupg         

# Copy source code to the container & build it
COPY . $HOME
WORKDIR $HOME
USER $DOCKER_USER

ENTRYPOINT ["cppsharp"]