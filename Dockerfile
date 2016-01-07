FROM cdecl/hadoop-hive:2.6.0

MAINTAINER greg.soertsz@gmail.com

COPY spark-1.5.1-bin-with-hive.tgz /opt
ADD start.sh /etc
RUN chmod u+x /etc/start.sh
WORKDIR /opt
RUN tar xzf spark-1.5.1-bin-with-hive.tgz 
RUN ln -s /opt/spark-1.5.1-bin-with-hive /opt/spark-1.5.1

COPY spark-env.sh /opt/spark-1.5.1/conf

ENV SPARK_HOME /opt/spark-1.5.1
ENV HADOOP_HOME /usr/local/hadoop
ENV HIVE_HOME /usr/local/hive
ENV PATH ${PATH}:$SPARK_HOME/sbin:$HIVE_HOME/bin

EXPOSE 8080 7077

ENTRYPOINT ["/etc/start.sh"]
