FROM java:8
VOLUME /tmp
ADD helloworld-0.1.0.jar helloworld.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/helloworld.jar"]