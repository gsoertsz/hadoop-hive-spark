FROM cdecl/hadoop-hive:2.6.0

MAINTAINER gsoertsz@odecee.com.au

RUN echo "Hello World"

# DOWNLOAD Spark 1.5.1 

RUN mkdir -p /tmp/download/spark
RUN wget -O /tmp/download/spark/spark-1.5.1.tgz http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1.tgz
WORKDIR /tmp/download/spark
RUN tar xzf spark-1.5.1.tgz
RUN rm spark-1.5.1.tgz

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/jre

WORKDIR /tmp/download/spark/spark-1.5.1
RUN ./make-distribution.sh --name spark-1.5.1 --tgz -Psparkr -Phadoop-2.6 -Phive -Phive-thriftserver -Pyarn
RUN cp -R dist /opt/spark-1.5.1

ENV SPARK_HOME /opt/spark-1.5.1

ENV PATH $PATH:$SPARK_HOME/sbin

RUN start-all.sh
