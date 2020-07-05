FROM alpine:3.12 

LABEL maintainer="Anand Varkey Philips <anandvarkeyphilips@gmail.com>"

RUN apk update && apk add openjdk8 maven nodejs chromium chromium-chromedriver

ENV JAVA HOME=/usr/lib/jvm/java-1.8-openjdk \
	PATH="JAVA_HOME/bin:${PATH}" \
	CHROME_BIN="/usr/bin/chromium-browser"

RUN mkdir -p /root/.m2 && mkdir /root/.m2/repository
COPY settings-backup.xml /root/.m2

RUN apk add --update npm
RUN npm config set registry "https://registry.npmjs.org/"
RUN npm install -g newman