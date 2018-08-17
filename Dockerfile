FROM ubuntu:trusty AS shaurya
MAINTAINER Shaurya

COPY index.html /index.html 
RUN echo "Appending to this file" >> /index.html

FROM nginx
MAINTAINER Shaurya

RUN apt-get update && apt-get install -y nano curl
COPY --from=shaurya /index.html /usr/share/nginx/html/index.html	
