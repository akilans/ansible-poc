# Ansible with Vagrant in windows

Setting up Ansible in Windows 10 machine with Vagrant

* Ansible Master - CentOS 7
* Ansible Slave1 - CentOS 7
* Ansible Slave2 - Ubuntu 16.04

## Setting up the Environment

* Install Virtualbox and Vagrant
* Run the below commands only if you are behind proxy

```bash
    set HTTP_PROXY=http://$USER_NAME:$PASSWORD@$PROXY_HOST:$PORT
    set HTTPS_PROXY=http://$USER_NAME:$PASSWORD@$PROXY_HOST:$PORT
    vagrant plugin install vagrant-proxyconf
    set VAGRANT_HTTP_PROXY=%HTTP_PROXY%
```

## Setting up Anisble Master

* Go to inside ansible-master-centos folder and run *vagrant up*
* Login into master machine by running *vagrant ssh* and run the below commands to install ansible

```bash
    sudo yum update
    sudo yum install ansible -y
```

## Setting up Ansible Slaves

* Go to inside ansible-slave1-centos folder and run *vagrant up*
* Go to inside ansible-slave2-ubuntu folder and run *vagrant up*
* In both slave machines Allow password login

```bash
    sudo vi /etc/ssh/sshd_config
    #Uncomment PasswordAuthentication yes
    sudo systemctl restart sshd
```

## SSH keys configuration

* Go to inside "ansible-master-ubuntu" machine and run the below commands
        
```bash
    ssh-keygen
    ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.33.11
    ssh-copy-id -i ~/.ssh/id_rsa vagrant@192.168.33.12
``` 
## Ansible Playbook Execution

* Run the below command in master machine to make sure that ansible master connected to slaves

```bash
    ansible all -i hosts -u vagrant -m ping
```