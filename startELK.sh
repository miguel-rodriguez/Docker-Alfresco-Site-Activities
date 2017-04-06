# Set Timezone
export TZ=GB

# Copy and set permission for activities.properties
cp /tmp/activities.properties /opt/activities
chown -R logstash:logstash /opt/activities

# Start ELK
/etc/init.d/redis-server restart
/etc/init.d/elasticsearch restart
/etc/init.d/logstash restart 
/etc/init.d/kibana start

# Keep the container running
/bin/bash
