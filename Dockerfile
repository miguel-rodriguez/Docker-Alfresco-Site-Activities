FROM sebp/elk:530

# Install custom logstash configuration
ADD logstash.conf /etc/logstash/conf.d/logstash.conf

# Install and run redis
RUN apt-get install -y redis-server
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf

# Install activities files
RUN mkdir /opt/activities
RUN mkdir -p /data/logs/activities
RUN chown -R logstash /data
ADD SQLTool.jar /opt/activities

# Add starting script
ADD startELK.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startELK.sh

ENTRYPOINT chmod +x /usr/local/bin/startELK.sh && /usr/local/bin/startELK.sh
