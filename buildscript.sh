
mkdir -p ./bin
cd ./bin

echo "Exporting environment variables"
export PATH=/opt/qt/5.11.2/gcc_64/bin:/opt/qt/5.11.2/gcc_64/libexec:$PATH
export CMAKE_PREFIX_PATH=/work/CaPTk/bin/ITK-build:/work/CaPTk/bin/DCMTK-build:/opt/qt/5.11.2/gcc_64/lib/cmake/Qt5:$CMAKE_PREFIX_PATH

echo "Running CMake"
cmake -DCMAKE_INSTALL_PREFIX="./install/appdir/usr" -DITK_DIR="/work/CaPTk/bin/ITK-build" -DDCMTK_DIR="/work/CaPTk/bin/DCMTK-build" -DBUILD_TESTING=OFF ..

echo "Running make + install"
make -j4 && make install/strip

echo "Installing Python3.8 and virtual environment for applications in /Front-End/src/applications"
yum -y install epel-release
yum -y update
# watned a reboot here
yum -y groupinstall “Development Tools”
yum -y install openssl-devel bzip2-devel libffi-devel xz-devel

yum -y install wget
wget https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tgz
tar xvf Python-3.8.16.tgz
cd Python-3.8*/
./configure --enable-optimizations
sudo make altinstall

cd /Front-End/src/applications
chmod +x BraTSPipeline.cxx
python3.8 -m venv fetsapp_venv
/Front-End/src/applications/fetsapp_venv/bin/pip install -e .

