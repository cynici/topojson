#! /bin/sh
RUNUSER_UID="${RUNUSER_UID:-1000}"
RUNUSER_HOME="${RUNUSER_HOME:-/data}"
set -ux
adduser -s /bin/false -D -h $RUNUSER_HOME -H -u $RUNUSER_UID runuser
cd $RUNUSER_HOME
exec gosu runuser "$@"
