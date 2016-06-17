FROM anoopnair/hadoop_base_alpine
MAINTAINER Anoop Nair<anoopnair.it@gmail.com>

LABEL description="Build Jboss BRMS 6.1.5 standalone image on Alpine Linux"

ENV EAP_VERSION 6.4.5
ENV BRMS_VERSION 6.1.5
ENV BRMS_HOME /opt/jboss-eap-$EAP_VERSION-brms-$BRMS_VERSION

ADD jboss-eap-$EAP_VERSION-brms-$BRMS_VERSION.tar.gz /opt

# Setup user and role
RUN $BRMS_HOME/bin/add-user.sh -a brmsadmin Redh@t11 --silent && \
	echo brmsadmin=admin >> $BRMS_HOME/standalone/configuration/application-roles.properties

# Admin-console, business-central Web port and git ports
EXPOSE 9990 8080 9400-9500

WORKDIR $BRMS_HOME

CMD ["bin/standalone.sh","-c","standalone.xml","-b", "0.0.0.0","-bmanagement","0.0.0.0"]
