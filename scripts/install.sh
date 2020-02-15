#!/bin/bash

sudo apt install -y python-gps python-serial libpython-dev python-numpy python-scipy swig python-pil python-flask python-gevent-websocket python-opengl python-pip python3-wxgtk4.0 python3-opengl python-wxgtk3.0 python-opengl

sudo pip install setuptools
sudo pip install ujson
sudo pip install pyudev
sudo pip install pyglet
sudo pip install pywavefront
sudo pip install flask_serialio


cd ~
git clone https://github.com/guliaka/RTIMULib2
cd RTIMULib2/Linux/python
python setup.py build
sudo python setup.py install

cd ~
git clone https://github.com/guliaka/pypilot
git clone --depth 1 https://github.com/guliaka/pypilot_data
cp -rv pypilot_data/* pypilot
cd pypilot
python setup.py build
sudo python setup.py install

sudo systemctl enable pypilot
sudo systemctl enable pypilot_web
sudo systemctl start pypilot
sudo systemctl start pypilot_web