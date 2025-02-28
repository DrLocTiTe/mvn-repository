FROM tomcat:9.0.38

#Install git
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y maven
RUN mkdir /home/gitRepositorio

#Set working directory
WORKDIR /home/gitRepositorio
        
RUN git clone https://github.com/jleetutorial/maven-project.git

WORKDIR /home/gitRepositorio/maven-project

RUN mvn package

COPY WebApp.war webapp/src/main/webapp/

COPY index.jsp /webapp/src/main/webapp/

EXPOSE 8080