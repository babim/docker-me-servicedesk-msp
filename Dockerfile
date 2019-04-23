FROM babim/centosbase:7-x86
ENV SOFT	ServiceDeskPlus-MSP
ENV EDITTION	pro
ENV SOFT_HOME	/opt/ManageEngine/${SOFT}

# install depend
RUN yum install curl -y && curl -Ls https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ManageEngine/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_HOME}"]
# Expose default HTTP connector port.
EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]