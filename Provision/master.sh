#!/bin/bash

### Arquivo de provisionamento da VM master             ###
### Chama as funções para provisionamento automatizado  ###

source /vagrant/Provision/vars.sh

install_keys;

config_hosts;

addUsers;

install_docker;

install_swarm;
