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
ADD activities.properties /opt/activities
RUN chown -R logstash /opt/activities

# Add Index Mappings and Dashboard
RUN /usr/local/bin/start.sh&
ADD createMappings.sh /tmp 
RUN chmod +x /tmp/createMappings.sh

ENTRYPOINT service redis-server start && /etc/init.d/elasticsearch start && sleep 30 && /etc/init.d/logstash start && /etc/init.d/kibana start && /tmp/createMappings.sh && /bin/bash
