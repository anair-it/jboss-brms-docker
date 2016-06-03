FROM alpine
MAINTAINER Anoop Nair<anoopnair.it@gmail.com>

LABEL description="Build Jboss BRMS 6.1.5 standalone image on Alpine Linux"

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk
ENV PATH $JAVA_HOME/bin:$PATH
ENV BRMS_HOME /opt/jboss-eap-6.4.5-brms-6.1.5

RUN apk --update add bash wget sudo openjdk7 && \
  rm -rf /var/cache/apk/* && \
  rm -rf /opt  && \
  mkdir -p /opt 

# Copy and untar brms install directory
COPY jboss-eap-6.4.5-brms-6.1.5.tar.gz /opt

RUN cd /opt && \
    tar xzf jboss-eap-6.4.5-brms-6.1.5.tar.gz -C /opt/ && \
   rm /opt/jboss-eap-6.4.5-brms-6.1.5.tar.gz

VOLUME ["$BRMS_HOME/.niogit", "$BRMS_HOME/.index",""$BRMS_HOME/standalone"]

# Admin-console and business-central Web port
EXPOSE 9990 8080 9400-9500

WORKDIR $BRMS_HOME

CMD ["bin/standalone.sh","-c","standalone.xml","-b", "0.0.0.0","-bmanagement","0.0.0.0"]
