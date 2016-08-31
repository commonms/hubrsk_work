# HUB Testing - Workspace for Europe
FROM commonms/hubrsk_base
MAINTAINER Jose M. Fernandez-Alba <jm.fernandezalba@commonms.com>

# Database schema
COPY init_europe.sql /docker-entrypoint-initdb.d/

# Entrypoint inits and starts Oracle database and SSH
COPY entrypoint.sh /sbin/
ENTRYPOINT ["/sbin/entrypoint.sh"]

# Default command
CMD ["/bin/bash"]
