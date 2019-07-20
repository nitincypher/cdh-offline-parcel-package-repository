FROM python:3

#Make hosting folder
RUN mkdir -p /var/www/html/cloudera-repos

#CDH6.2.0 parcels (Apache Impala, Apache Kudu, Apache Spark 2, and Cloudera Search and others)
RUN wget --recursive --no-parent --no-host-directories https://archive.cloudera.com/cdh6/6.2.0/parcels/ -P /var/www/html/cloudera-repos
RUN wget --recursive --no-parent --no-host-directories https://archive.cloudera.com/gplextras6/6.2.0/parcels/ -P /var/www/html/cloudera-repos

#Sqoop Connectors
RUN wget --recursive --no-parent --no-host-directories http://archive.cloudera.com/sqoop-connectors/parcels/latest/ -P /var/www/html/cloudera-repos

#Foler Permissions
RUN chmod -R ugo+rX /var/www/html/cloudera-repos/cdh6
RUN chmod -R ugo+rX /var/www/html/cloudera-repos/gplextras6
RUN chmod -R ugo+rX /var/www/html/cloudera-repos/sqoop-connectors

#Working Directory
WORKDIR /var/www/html

#Start Python Server
ENTRYPOINT ENTRYPOINT ["python", "-m http.server"]
