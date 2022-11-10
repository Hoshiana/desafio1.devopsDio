#!/bin/bash

### Arquivo de provisionamento automatizado para VMs node   ###

source /vagrant//Provision/vars.sh

install_keys;

config_hosts;

addUsers;

install_docker;
