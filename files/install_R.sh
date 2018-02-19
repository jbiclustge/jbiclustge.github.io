
version=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f2)
if [ $version -lt "8" ]; then
  echo "Java 1.8 or higher is required."
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install -y oracle-java8-installer
else
  sudo apt-get update  
fi

sudo apt-get install -y build-essential
sudo apt-get install -y fort77
sudo apt-get install -y xorg-dev
sudo apt-get install -y liblzma-dev  libblas-dev gfortran
sudo apt-get install -y gcc-multilib
sudo apt-get install -y gobjc++
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libpcre3-dev

## check latest version of R at https://cran.r-project.org/src/base/R-3/
RVERSION=3.4.3

mkdir ~/compile-R

cd ~/compile-R

wget https://cran.r-project.org/src/base/R-3/R-$RVERSION.tar.gz
tar -zxvf R-$RVERSION.tar.gz

cd R-$RVERSION/

./configure --enable-R-shlib --enable-R-static-lib
make 
#sudo make install

#rm -f -R ~/compile-R



