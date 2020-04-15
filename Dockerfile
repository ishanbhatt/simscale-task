FROM gradle:5.6.3-jdk8

ENV http_proxy <PROXY:SITE>:<PORT>
ENV https_proxy <PROXY:SITE>:<PORT>

COPY src /usr/src/app/src
COPY build.gradle /usr/src/app
COPY gradle.properties /usr/src/app

WORKDIR /usr/src/app

RUN gradle build

COPY small-log.txt /
RUN cp build/libs/Simscale_v1.jar /