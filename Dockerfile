FROM openjdk:17

EXPOSE 8080

RUN mkdir /app

COPY build/libs/*.jar /app/
COPY archivos/ /app/

ENTRYPOINT ["sh","/app/docbash.sh"]

#RUN mkdir /app

#COPY ./archivos /app
#/var/jenkins_home/workspace/compilacionjava

#ENTRYPOINT ["java","-jar","/app/demo-Variable.jar"]


#"-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom"

#FROM openjdk:16
#COPY * /home/gradle/src
#WORKDIR /home/gradle/src
#USER root
#ENTRYPOINT ["sh","entry.sh"]


