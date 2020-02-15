#!/bin/bash

sudo apt install -y python-gps python-serial libpython-dev python-numpy python-scipy swig python-pil python-flask python-gevent-websocket python-opengl python-pip 
sudo apt install -y git python3-wxgtk4.0 python3-opengl python-wxgtk3.0 python-opengl wiringpi

sudo pip install setuptools
sudo pip install ujson
sudo pip install pyudev
sudo pip install pyglet
sudo pip install pywavefront
sudo pip install flask_socketio

sudo apt update
sudo apt upgrade -y

cd ~
git clone https://github.com/guliaka/RTIMULib2
cd RTIMULib2/Linux/python
python setup.py build
sudo python setup.py install

cd ~
git clone -b dev1 https://github.com/guliaka/pypilot
git clone --depth 1 https://github.com/guliaka/pypilot_data
cp -rv pypilot_data/* pypilot
cd pypilot
python setup.py build
sudo python setup.py install

cd ~
sudo cp pypilot/scripts/debian/etc/systemd/system/* /etc/systemd/system/

sudo systemctl enable pypilot
sudo systemctl enable pypilot_web
sudo systemctl enable pypilot_hat
sudo systemctl enable pypilot_boatimu
sudo systemctl start pypilot
sudo systemctl start pypilot_web

mkdir .pypilot
chmod 775 .pypilot

sudo reboot