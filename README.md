# Jboss BRMS docker
Build a Jboss BRMS docker image on Alpine Linux distro.

## Version
- BRMS: 6.1.5

>Dockerhub: https://hub.docker.com/r/anoopnair/jboss-brms/

## Start standalone BRMS container
- ``docker run -it -p 38080:8080 -p 9990:9990 anoopnair/jboss-brms:6.1.5``
- Hit 'http://localhost:38080/business-central' url
- Login using brmsuser/Redh@t11
- Create repositories and rules
