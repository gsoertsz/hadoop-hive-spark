FROM cdecl/hadoop-hive:2.6.0

MAINTAINER greg.soertsz@gmail.com

RUN mkdir -p /tmp/downloads/spark
RUN wget -O /tmp/downloads/spark/spark-1.5.1.tgz http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1.tgz

ENV JAVA_HOME /opt/jvm/
