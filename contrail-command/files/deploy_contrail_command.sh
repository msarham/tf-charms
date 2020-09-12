#!/bin/bash -e
# The script is needed to run Contrail Command deploy in virtualenv
# to prevent issues with installed librarys

apt-get install -y python-pip

+# translate juju proxy vars into traditional proxy vars
+[ -n $JUJU_CHARM_HTTP_PROXY ]  && export http_proxy=$JUJU_CHARM_HTTP_PROXY
+[ -n $JUJU_CHARM_HTTPS_PROXY ] && export https_proxy=$JUJU_CHARM_HTTPS_PROXY
+[ -n $JUJU_CHARM_NO_PROXY ]    && export no_proxy=$JUJU_CHARM_NO_PROXY

rm -rf /tmp/venv
virtualenv /tmp/venv
source /tmp/venv/bin/activate

pip install "ansible==2.7.11"

export HOME=/root

$@
