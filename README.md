# desafio1.devopsDio
Desafio 1 Estudando Vagrant
Descrição
Neste desafio de projeto foi criado um Cluster Swarm local, utilizando máquinas virtuais no Virtualbox. Foi aplicado conhecimento em Vagrant. Foi criado script que permite a impelmentação das máquinas automaticamente.

O que foi elaborado:

Editado um Vagrantfile com as definições de 4 máquinas virtuais. Sendo uma máquina com o nome de master e as outras com os nomes de node01, node02 e node03; 
Todas as máquinas virtuaas possuirá um IP fixo em rede privada 10.10.10.# ; 
Todas as máquinasV possuiem o Docker pré-instalado; 
A máquina com o nome de Master é o nó manager do cluster Swarm. 
As demais máquinas deverão ser incluídas no cluster Swarm como Workers com nomes de node.
Os scripts foram editados utilizando funções para simplificar a implantação do desafio.
