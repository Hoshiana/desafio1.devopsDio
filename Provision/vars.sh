#!/bin/bash

### Arquivo com funcoes e variaveis para provisionamento das VMs do cluster ###
### Curso Devops DIO Banco Carrefour                                        ###
### Aluno: Antonio Augusto Borges           Data: 04/11/2022                ###
###                                                                         ###

USER=$"aluno"
PASS=$"Toor123"

function install_keys{
# Garantindo as keys
KEY_PATH=$"/vagrant/files"
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
}

function config_hosts{
# Garantindo os hosts
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '10.10.10.105 master.devops.dio' >> /etc/hosts
echo '10.10.10.106 node01.devops.dio' >> /etc/hosts
echo '10.10.10.107 node02.devops.dio' >> /etc/hosts
echo '10.10.10.108 node03.devops.dio' >> /etc/hosts
}

function addUsers{
# Criando o usuário aluno
useradd -m -d '/home/${USER}' -p $(openssl passwd -1 ${PASS}) -s /bin/bash ${USER}

# Alterando a senha do usuário vagrant
sudo usermod -p $(openssl passwd -1 ${PASS}) vagrant

# Alterando a senha do root 
sudo usermod -p $(openssl passwd -1 ${PASS}) root
}

function install_docker{
curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/2.12.2/docker-compose-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
udo usermod -aG docker vagrant
systemctl start docker
systemctl enable docker
}

function install_swarm{
sudo docker swarm init --advertise-addr=10.10.10.105
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
}



