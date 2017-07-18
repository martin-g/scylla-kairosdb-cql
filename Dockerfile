FROM scylladb/scylla:1.7.2

#install nc
RUN yum install nc -y

#install
RUN yum install wget -y && \
    wget https://github.com/kairosdb/kairosdb/releases/download/v1.2.0-beta2/kairosdb-1.2.0-0.2beta.rpm && \
    yum install -y kairosdb-1.2.0-0.2beta.rpm && \
    rm -rf kairosdb-1.2.0-0.2beta.rpm

ADD supervisor/ /etc/supervisord.conf.d
ADD kairos-run.sh kairos-run.sh
RUN chmod +x /kairos-run.sh
