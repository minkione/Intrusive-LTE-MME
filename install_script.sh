#!/bin/sh
sudo apt install python3
#install srsran dependencies
sudo apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev
#install pysctp
git clone https://github.com/P1sec/pysctp.git
cd pysctp
sudo python setup.py install
cd ..
#install pycrate
git clone https://github.com/P1sec/pycrate.git
cd pycrate
python setup.py install
cd ..


#download and install bladeRF drivers and cli
git clone https://github.com/Nuand/bladeRF.git
sudo apt-get install libusb
cd bladeRF
mkdir -p build
cd build
cmake [options] ../
make
sudo make install
sudo ldconfig
cd ..
cd ..


#soapySDR
sudo apt-get install cmake g++ libpython3-dev python3-numpy swig
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig #needed on debian systems
SoapySDRUtil --info


#download and build srsRAN
git clone https://github.com/srsRAN/srsRAN.git
cd srsRAN
mkdir build
cd build
cmake ../
make
make test
#install srsRAN
sudo make install
srsran_install_configs.sh user
cd ..
cd ..
