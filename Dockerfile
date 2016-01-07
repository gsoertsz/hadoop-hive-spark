FROM cdecl/hadoop-hive:2.6.0

MAINTAINER greg.soertsz@gmail.com

COPY spark-1.5.1-with-hive.tgz /opt
ADD start.sh /etc
RUN chmod u+x /etc/start.sh
WORKDIR /opt
RUN tar xzf spark-1.5.1-with-hive.tgz 
RUN ln -s /opt/spark-1.5.1-bin-spark-1.5.1 /opt/spark-1.5.1

COPY spark-env.sh /opt/spark-1.5.1/conf

ENV SPARK_HOME /opt/spark-1.5.1

ENV PATH ${PATH}:$SPARK_HOME/sbin

EXPOSE 8080 7077

ENTRYPOINT ["/etc/start.sh"]
