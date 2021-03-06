```
useradd -m -d /home/rails rails -s /bin/bash
passwd rails

Enter new UNIX password:  [RAILS_USER_PASSWORD]
Retype new UNIX password: [RAILS_USER_PASSWORD]

# grep rails /etc/passwd
# userdel rails
```

```sh
cd ~

wget https://raw.githubusercontent.com/the-teacher/TheRailsDeploy/master/check_soft.sh
chmod 744 check_soft.sh

~/check_soft.sh
```

```
echo '''export LC_ALL="en_US.UTF-8"' >> ~/.bashrc
echo '''export LANGUAGE="en_US:en"'  >> ~/.bashrc
source ~/.bashrc
```

```
apt-get install aptitude -y
apt-get update && apt-get upgrade -y
```

```
apt-get install build-essential -y
```

```
apt-add-repository ppa:brightbox/ruby-ng -y
apt-get update
apt-get install ruby2.1 ruby2.1-dev -y
```

```
apt-get install curl checkinstall git git-core autoconf -y
apt-get install openssl libssl-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libxslt1.1 libxslt1-dev libxml2 libxml2-dev libxslt-dev libc6-dev libgdbm-dev libncurses5-dev libtool pkg-config libffi-dev -y
apt-get install bison libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 -y
```

```
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install nodejs -y
```

```
apt-add-repository ppa:jon-severinsson/ffmpeg -y
apt-get update
apt-get install ffmpeg -y
```

```
apt-get install libjpeg-dev libpng-dev libtiff-dev libgif-dev libwebp-dev -y
```

```
cd /tmp
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz
cd ImageMagick-6.8.X-Y
./configure
checkinstall
```

```
sudo apt-get install memcached -y
```

```
cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
checkinstall
```

```
echo '''deb http://us.archive.ubuntu.com/ubuntu precise main universe' >> /etc/apt/sources.list
apt-get update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password MYSQL_ROOT_PASSWORD'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MYSQL_ROOT_PASSWORD'

apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev libmysql-ruby -y

mysql -u root -pMYSQL_ROOT_PASSWORD
mysql> CREATE USER 'rails'@'localhost' IDENTIFIED BY 'MYSQL_RAILS_USER_PASSWORD';

GRANT ALL PRIVILEGES ON * . * TO 'rails'@'localhost';
FLUSH PRIVILEGES;

mysql> \q

# GRANT ALL ON *.* TO 'rails'@'localhost';
# CREATE DROP DELETE INSERT SELECT UPDATE
```

```
apt-get install postgresql postgresql-contrib libpq-dev -y
su - postgres
createuser -d -a -P rails

Enter password for new role: [PSQL_RAILS_USER_PASSWORD]
Enter it again: [PSQL_RAILS_USER_PASSWORD]

createdb -E UTF8 -O rails rails_app_database

psql -h localhost -U rails -d rails_app_database
Password for user rails: [PSQL_RAILS_USER_PASSWORD]
psql> \q

exit
```

```
cd /tmp
wget http://sphinxsearch.com/files/sphinx-2.1.9-release.tar.gz
tar xvzf sphinx-2.1.9-release.tar.gz
cd sphinx-2.1.9-release

./configure --with-pgsql --with-mysql

checkinstall

# PS: if libpq-fe.h not found, following exporsts can be helpful
# export C_INCLUDE_PATH=/usr/include/postgresql/
# export CPLUS_INCLUDE_PATH=/usr/include/postgresql/
# export LIBRARY_PATH=/usr/include/postgresql/
```

```
apt-get install openjdk-7-jre-headless -y

cd /tmp
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb
dpkg -i elasticsearch-1.1.1.deb
ln -s /etc/init.d/elasticsearch /usr/local/bin/elasticsearch
```

```
apt-get install phantomjs -y
```

```
apt-get install advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush -y
```

```
cd /tmp
wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
tar -xzf pngout-20130221-linux.tar.gz
cp /tmp/pngout-20130221-linux/x86_64/pngout /usr/local/bin/
```

```
apt-get install libpcre++-dev libssl-dev libgeoip-dev -y

cd /tmp
wget http://nginx.org/download/nginx-1.7.4.tar.gz
tar -xzf nginx-1.7.4.tar.gz
cd nginx-1.7.4/

./configure --with-http_gzip_static_module
checkinstall 

ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
```

```
# user  nobody;
worker_processes  1;

events {
  worker_connections  1024;
}


http {
  include       mime.types;
  default_type  application/octet-stream;

  sendfile        on;
  #tcp_nopush     on;
  keepalive_timeout  65;

  include /home/rails/www/rails_app/shared/web_server/nginx/config;
}
```

```
sudo -s 'echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list'
wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
apt-get update
apt-get install newrelic-sysmond
nrsysmond-config --set license_key=[YOUR_LICENSE_KEY]
/etc/init.d/newrelic-sysmond start
```

**rails**

```
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.bashrc
rvm list
```

```sh
cd ~

wget https://raw.githubusercontent.com/the-teacher/TheRailsDeploy/master/check_soft.sh
chmod 744 check_soft.sh

~/check_soft.sh
```
