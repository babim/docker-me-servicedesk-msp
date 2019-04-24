FROM babim/centosbase:7-x86
ENV SOFT	ServiceDeskPlus-MSP
ENV EDITTION	standard
ENV SOFT_HOME	/opt/ManageEngine/${SOFT}
ENV MACHINE_TYPE x86

# download option
RUN yum install curl -y && \
    curl -Ls https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
    chmod +x /option.sh

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ManageEngine/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_HOME}"]
# Expose default HTTP connector port.
EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]