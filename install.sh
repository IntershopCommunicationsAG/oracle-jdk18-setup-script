#!/bin/sh

# the script must be started by root or with sudo permissions
# see http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
# for jdk downloads

# specify the jdk
JDK='jdk1.8.0_77'
JDKFILE='jdk-8u77-linux-x64.tar.gz'
JDKPATH="http://download.oracle.com/otn-pub/java/jdk/8u77-b03/$JDKFILE"

# oracle request header
ORACLELIC="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"

# script path
PROG=$0
REALPATH=$(readlink -f "$PROG")
BASEDIR=$(dirname $REALPATH)

# create dir
mkdir -p /usr/java

# install jdk
cd /tmp && wget --no-cookies --no-check-certificate --header "$ORACLELIC" "$JDKPATH" -O /tmp/$JDKFILE && mkdir -p /usr/java && tar zxf /tmp/$JDKFILE -C /usr/java && ln -s /usr/java/$JDK /usr/java/jdk1.8.0

# install jce - please check the license agreement!
cd /tmp && wget --no-cookies --no-check-certificate --header "$ORACLELIC" "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -O /tmp/jce_policy-8.zip && unzip -o /tmp/jce_policy-8.zip && \cp -f /tmp/UnlimitedJCEPolicyJDK8/* /usr/java/jdk1.8.0/jre/lib/security && rm -rf /tmp/UnlimitedJCEPolicyJDK8

# add jdk to path and set JAVA_HOME
cp $BASEDIR/java.sh /etc/profile.d
source ~/.bashrc

# validate the installation
java -version
