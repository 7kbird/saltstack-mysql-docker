FROM mysql:latest
MAINTAINER 7kbird <7kbird@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Install Stable Salt
RUN curl -L https://bootstrap.saltstack.com -o install_salt.sh
RUN sh install_salt.sh -D -X git v2014.7.5

COPY salt-minion-entrypoint.sh /salt-minion-entrypoint.sh
ENTRYPOINT ["/salt-minion-entrypoint.sh"]
CMD ["/etc/salt"]