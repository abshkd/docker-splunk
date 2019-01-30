#!/bin/ash
# Copyright 2019 Splunk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

#localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
export LANG=en_US.utf8

apk update && apk add wget sudo
apk add busybox ansible py-pip
pip install --upgrade pip
pip install requests

cd /bin
ln -s busybox killall
ln -s busybox nslookup
ln -s busybox readline
ln -s busybox route
ln -s busybox syslogd
ln -s busybox traceroute
chmod u+s /bin/ping
addgroup sudo

echo "
## Allows people in group sudo to run all commands
%sudo  ALL=(ALL)       ALL" >> /etc/sudoers

# Clean
rm -rf /var/cache/apk/*
rm -rf /install.sh
