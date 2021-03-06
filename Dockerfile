FROM sylvainlasnier/ubuntu
MAINTAINER Sylvain Lasnier <sylvain.lsnier@gmail.com>

RUN apt-get update -qq && apt-get install -y mysql-server-5.6

ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 664 /etc/mysql/conf.d/my.cnf
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql","/var/log/mysql"]

EXPOSE 3306

CMD ["/usr/local/bin/run"]
