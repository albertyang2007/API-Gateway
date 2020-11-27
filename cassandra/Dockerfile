FROM cassandra:3.11.9

#Refer to: https://hopding.com/cassandra-authentication-in-docker-container
# Require user & pass for accessing Cassandra instance within container
RUN echo "authenticator: PasswordAuthenticator" >> /etc/cassandra/cassandra.yaml
COPY cassandra-lucene-index-plugin-3.11.3.0.jar /opt/cassandra/lib/cassandra-lucene-index-plugin-3.11.3.0.jar
