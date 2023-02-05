FROM amazon/aws-cli
MAINTAINER Yuqiang Huang <york@ibsettlecn.com>
ARG JDK_URL=https://download.bell-sw.com/java/17.0.6+10/bellsoft-jdk17.0.6+10-linux-amd64.rpm
ARG MAVEN_VERSION=3.8.7
ARG USER_HOME_DIR="/root"
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN yum update -y \
  && yum install -y $JDK_URL \
  && mkdir -p /usr/share/maven \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
  && amazon-linux-extras install docker

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

ENTRYPOINT [ "" ]
