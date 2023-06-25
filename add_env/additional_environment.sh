#/bin/bash

sudo yum -y install epel-release
sudo yum -y update
# watned a reboot here
sudo yum -y groupinstall “Development Tools”
sudo yum -y install openssl-devel bzip2-devel libffi-devel xz-devel

sudo yum -y install wget
wget https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tgz
tar xvf Python-3.8.16.tgz
cd Python-3.8*/
./configure --enable-optimizations
sudo make altinstall

cd /Front-End/src/applications
python3.8 -m venv fetsapp_venv
/Front-End/src/applications/fetsapp_venv/bin/pip install -e .
