#######################################################
# This dockerfile builds a opendaylight develop       #
# environment                                         #
#                                                     #
# Author:Ravi Huang                                   #
# Repository: ravihuang/odl-env                       #
# Version: 1.0                                        #
#                                                     #
#######################################################

FROM ravihuang/maven

MAINTAINER Ravi Huang 1657231876@qq.com


##### Update system and install apps
RUN     apt-get -qq update

##### Environment
ENV     MVN_SETTING_URL     https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml

##### Maven setting
RUN     mkdir $HOME/.m2
RUN     wget -q -O - $MVN_SETTING_URL > ~/.m2/settings.xml

##### Expose port for controller
EXPOSE  6633 8181

##### Sync source code folder
VOLUME  ["/home/odl"]
VOLUME  ["/root/.m2"]

##### Clean
RUN     apt-get clean
RUN     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
