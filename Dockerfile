# HUB Testing - Workspace for Europe
FROM commonms/hubrsk_base
MAINTAINER Jose M. Fernandez-Alba <jm.fernandezalba@commonms.com>

# Database schema
COPY init_europe.sql /docker-entrypoint-initdb.d/

# Prepare environment
VOLUME /servicios/was7/hubriesgos
WORKDIR /servicios/was7/hubriesgos

RUN mkdir -p /opt/WebSphere7/AppServer/java/bin/sparcv9 \
    && ln -s $JAVA_HOME/bin/java /opt/WebSphere7/AppServer/java/bin/sparcv9/java

# Entrypoint inits and starts Oracle database and SSH
COPY entrypoint.sh /sbin/
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]

# Default command
CMD ["/bin/bash"]
