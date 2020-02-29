FROM babim/centosbase:7
ENV SOFT	ServiceDeskPlus-MSP
ENV EDITTION	pro
ENV SOFT_OPT	/opt/ManageEngine
ENV SOFT_HOME	${SOFT_OPT}/${SOFT}${SOFTSUB}

# download option
RUN yum install curl -y && \
    curl -Ls https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
    chmod +x /option.sh

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ManageEngine/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_OPT}"]
# Expose default HTTP connector port.
EXPOSE 8080

CMD ["/docker-entrypoint.sh"]