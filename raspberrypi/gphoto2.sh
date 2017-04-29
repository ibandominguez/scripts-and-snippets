# Install Dependencies
sudo apt-get install libltdl-dev libusb-dev libusb-1.0 libexif-dev libpopt-dev

# Download Latest libgphoto2
wget http://downloads.sourceforge.net/project/gphoto/libgphoto/2.5.7/libgphoto2-2.5.7.tar.gz

# Download Latest gphoto2
wget http://downloads.sourceforge.net/project/gphoto/gphoto/2.5.6/gphoto2-2.5.6.tar.gz

# Install libgphoto2
tar -xvzf libgphoto2-2.5.7.tar.gz
cd libgphoto2-2.5.7
./configure
make #This is going to take some time. Go get a cup of coffee.
sudo make install

# Install gphoto2
tar -xvzf gphoto2-2.5.6.tar.gz
cd gphoto2-2.5.6
./configure
make #Much faster then libgphoto2
sudo make install
