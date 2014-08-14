cd ~
wget https://raw.githubusercontent.com/the-teacher/TheRailsDeploy/master/check_soft.sh
chmod 744 check_soft.sh

echo '''export LC_ALL="en_US.UTF-8"' >> ~/.bashrc
echo '''export LANGUAGE="en_US:en"'  >> ~/.bashrc
source ~/.bashrc

apt-get install aptitude -y
apt-get update && apt-get upgrade -y

apt-get install build-essential -y
apt-get install curl checkinstall autoconf openssl libssl-dev libc6-dev libreadline6 libreadline6-dev libxml2 libxml2-dev libxslt1.1 libxslt1-dev libxslt-dev zlib1g zlib1g-dev -y

apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get install ruby2.1 ruby2.1-dev -y

curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install nodejs -y

apt-add-repository ppa:jon-severinsson/ffmpeg -y
apt-get update
apt-get install ffmpeg -y

apt-get install libjpeg-dev libpng-dev libtiff-dev libgif-dev libwebp-dev -y

cd /tmp
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz
cd ImageMagick-6.8.X-Y
./configure
checkinstall

sudo apt-get install memcached -y

cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
checkinstall

echo '''deb http://us.archive.ubuntu.com/ubuntu precise main universe' >> /etc/apt/sources.list
apt-get update
debconf-set-selections <<< 'mysql-server mysql-server/root_password password MYSQL_ROOT_PASSWORD'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MYSQL_ROOT_PASSWORD'
apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev libmysql-ruby -y
mysql -u root -pMYSQL_ROOT_PASSWORD

apt-get install postgresql postgresql-contrib libpq-dev -y
su - postgres
createuser -d -a -P rails_app_user
createdb -E UTF8 -O rails_app_user rails_app_database
psql -h localhost -U rails_app_user -d rails_app_database
