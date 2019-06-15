sudo yum update -y
sudo yum install -y python3 gcc-c++ git

# install nodejs
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install -y nodejs

# install mongodb
echo "[mongodb-org-4.0]" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
echo "name=MongoDB Repository" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
echo "baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/4.0/x86_64/" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
echo "gpgcheck=1" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
echo "enabled=1" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
echo "gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc" | sudo tee -a /etc/yum.repos.d/mongodb-org-4.0.repo
sudo yum install -y mongodb-org

# install cmake
wget https://cmake.org/files/v3.10/cmake-3.10.0.tar.gz
tar -xvzf cmake-3.10.0.tar.gz
cd cmake-3.10.0
./bootstrap
make
sudo make install

# install opencv 3
git clone https://github.com/Itseez/opencv.git
cd opencv/
git checkout 3.4.6
mkdir ../opencv-build
cd ../opencv-build
cmake ../opencv
make
sudo make install

git clone https://github.com/BalloonInc/get-me-through.git
cd get-me-through/
npm install

mkdir -p data/
mkdir -p bin/
wget -O bin/www https://gist.githubusercontent.com/malikshubham827/439cec7df328b12b1a40dcab550aef20/raw/0f71aedba8554eee00e515c648db04952f37c247/www

# fill with images
cd known_people/
wget -O wouter.png https://www.ballooninc.be/images/wouter.c00ff9ea.png
wget -O pj.png https://www.ballooninc.be/images/pj.e72c3b8e.png
wget -O djanx.jpg https://www.ballooninc.be/images/django.f7003232.jpg
wget -O gilles.jpg https://www.ballooninc.be/images/gilles.8a0b0f06.jpg
wget -O bart.jpg https://www.ballooninc.be/images/bart.010d87bb.jpg

sudo mkdir -p /data/db
sudo chown -R $USER:$USER /data
mongod --fork --logpath ~/mongo.log
