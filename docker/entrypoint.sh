#!/bin/bash

chown -R keystone:keystone /etc/keystone
exec "$@"