#!/bin/sh

# created by Intershop scripts
# set JAVA_HOME and extends path
# should be located in /etc/profile.d

JAVA_HOME=/usr/java/jdk1.8.0
PATH=$JAVA_HOME/bin:$PATH

export JAVA_HOME PATH
