```
-------------------------------------------------------------------------------------
Thank you for using DigitalOcean's Rails Application.
We have created a default Rails application that can be seen from http://178.62.15.173/
-------------------------------------------------------------------------------------
You can use the following SFTP credentials to upload your webpages (using FileZilla/WinSCP/Rsync):

Host: 178.62.15.173
User: rails
Pass: RAILS_USER_PASSWORD

-------------------------------------------------------------------------------------
“These instructions are stored in /root/RAILS for your review.n”You can use the following MySQL database credentials:

DB: rails
User: rails
Pass: RAILS_DB_PASSWORD

If you require root database credentials, they are in /root/.my.cnf
-------------------------------------------------------------------------------------
Nginx listens on public IP (178.62.15.173) port 80 and forwards requests to Unicorn on port 8080
Nginx access log is in /var/log/nginx/access.log and error log is in /var/log/nginx/error.log
Unicorn configuration files are in /home/unicorn/unicorn.conf and /etc/default/unicorn
Unicorn log is in /home/unicorn/log/unicorn.log
-------------------------------------------------------------------------------------
To get a list of available gems: gem list
To get a list of Rubies: rvm list
To get Gem environment: gem env
-------------------------------------------------------------------------------------
```






#### Check installed soft

```
ssh root@178.62.15.173

cd ~

wget https://raw.githubusercontent.com/the-teacher/TheRailsDeploy/master/check_soft.sh
chmod 744 check_soft.sh

~/check_soft.sh
```

You will see something like this

```
Base:

Linux MyRailsApp 3.13.0-27-generic #50-Ubuntu SMP Thu May 15 18:06:16 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
DISTRIB_ID=Ubuntu DISTRIB_RELEASE=14.04 DISTRIB_CODENAME=trusty DISTRIB_DESCRIPTION="Ubuntu 14.04 LTS" NAME="Ubuntu" VERSION="14.04, Trusty Tahr" ID=ubuntu ID_LIKE=debian PRETTY_NAME="Ubuntu 14.04 LTS" VERSION_ID="14.04" HOME_URL="http://www.ubuntu.com/" SUPPORT_URL="http://help.ubuntu.com/" BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
 /usr/bin/gcc
 checkinstall : Not found

Check LANG vars:

LANGUAGE has value: en_US:en
LANG has value: en_US.UTF-8
LC_ALL should be set
LC_CTYPE has value: UTF-8

Programming Langs:

 /usr/local/rvm/bin/rvm
 /usr/local/rvm/rubies/ruby-2.0.0-p353/bin/ruby
 node : Not found

Converters:

 ffmpeg : Not found
 convert : Not found

CacheStores:

 memcached : Not found
 redis-server : Not found

DataBases:

 psql : Not found
 /usr/bin/mysql

Search:

 searchd : Not found
 elasticsearch : Not found

Helpers:

 git : Not found
 tmux : Not found
 phantomjs : Not found

Image Optimizers:

 gifsicle : Not found
 jhead : Not found
 jpegoptim : Not found
 jpegtran : Not found
 optipng : Not found
 pngcrush : Not found
 pngout : Not found
```

Add Missing ENV variable LC_ALL for Perl to `.bashrc` and reload it

```
# locale-gen
# dpkg-reconfigure locales

echo '''export LC_ALL="en_US.UTF-8"' >> ~/.bashrc
echo '''export LANGUAGE="en_US:en"'  >> ~/.bashrc

source ~/.bashrc
```

List of users

```
awk -F":" '{ print "username: " $1 }' /etc/passwd
```

create folder for www applications

```
mkdir -p /srv/www
```

#### Install soft

Ruby

```
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.1 ruby2.1-dev
```

```
ssh root@178.62.15.173

apt-get install aptitude -y
apt-get update && apt-get upgrade -y
# apt-get update --fix-missing

apt-get install checkinstall build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxslt1.1 libxslt1-dev libxml2 libxml2-dev libxslt-dev autoconf libc6-dev -y
```

**ImageMagick**

via sources

```
apt-get install libjpeg-dev libpng-dev libtiff-dev libgif-dev -y
```

```
cd /tmp

wget https://webp.googlecode.com/files/libwebp-0.4.0.tar.gz
tar xvzf libwebp-0.4.0.tar.gz
cd libwebp-0.4.0/

./configure
checkinstall
```

```
wget http://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz
cd ImageMagick-6.8.8-8

./configure
checkinstall
```

via apt-get

```
aptitude install libgd2-xpm libmagickcore-dev -y
apt-get install  imagemagick libmagickcore-dev libmagickwand-dev -y
```

**Image optimizers**

Optional step

```
apt-get install advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush -y
```

```
cd /tmp
wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
tar -xzf pngout-20130221-linux.tar.gz
cp /tmp/pngout-20130221-linux/x86_64/pngout /usr/local/bin/
```

**MySql**

```
echo '''deb http://us.archive.ubuntu.com/ubuntu precise main universe' >> /etc/apt/sources.list 
apt-get update

debconf-set-selections <<< 'mysql-server mysql-server/root_password password MYSQL_ROOT_PASSWORD'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password MYSQL_ROOT_PASSWORD'

apt-get install mysql-server mysql-common mysql-client libmysqlclient-dev libmysql-ruby -y
mysql -u root -pMYSQL_ROOT_PASSWORD

CREATE USER 'rails_app_user'@'localhost' IDENTIFIED BY 'MYSQL_RAILS_USER_PASSWORD';
```

**PostgreSql**

```
apt-get install postgresql postgresql-contrib  libpq-dev -y
```

If user `postgres` are required

```
# createuser -s postgres
# createuser -d -a -P rails

sudo su - postgres
createdb -E UTF8 -O postgres postgres
psql -U postgres
```

**Sphinx**

```
cd /tmp

wget http://sphinxsearch.com/files/sphinx-2.1.9-release.tar.gz
tar xvzf sphinx-2.1.9-release.tar.gz
cd sphinx-2.1.9-release

./configure --with-pgsql --with-mysql

export C_INCLUDE_PATH=/usr/include/postgresql/
export CPLUS_INCLUDE_PATH=/usr/include/postgresql/
export LIBRARY_PATH=/usr/include/postgresql/

checkinstall
```

**ElasticSearch**

```
cd /tmp
apt-get install openjdk-7-jre-headless -y
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb

# http://www.cyberciti.biz/howto/question/linux/dpkg-cheat-sheet.php
dpkg -i elasticsearch-1.1.1.deb

dpkg -L elasticsearch | grep init # => /etc/init.d/elasticsearch

ln -s /etc/init.d/elasticsearch /usr/local/bin/elasticsearch

sudo service elasticsearch start
sudo service elasticsearch stop

elasticsearch start
elasticsearch stop
```

**NodeJS**

```
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install nodejs -y
```

**FFMPG**

Optional step

```
apt-add-repository ppa:jon-severinsson/ffmpeg -y
sudo apt-get update
apt-get install ffmpeg -y
```

**Redis**

```
cd /tmp

wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable

checkinstall
```

**Memcached**

```
sudo apt-get install memcached -y
```

**PhantomJS**

```
apt-get install phantomjs
```

**TMUX**

```
apt-get install tmux
```

#### Check installed soft again

```
~/check_soft.sh
```

You will see something like this

```
Base:

Linux MyRailsApp 3.13.0-27-generic #50-Ubuntu SMP Thu May 15 18:06:16 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
DISTRIB_ID=Ubuntu DISTRIB_RELEASE=14.04 DISTRIB_CODENAME=trusty DISTRIB_DESCRIPTION="Ubuntu 14.04.1 LTS" NAME="Ubuntu" VERSION="14.04.1 LTS, Trusty Tahr" ID=ubuntu ID_LIKE=debian PRETTY_NAME="Ubuntu 14.04.1 LTS" VERSION_ID="14.04" HOME_URL="http://www.ubuntu.com/" SUPPORT_URL="http://help.ubuntu.com/" BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"

 /usr/bin/gcc
 /usr/bin/checkinstall

Langs:

 /usr/local/rvm/bin/rvm
 /usr/local/rvm/rubies/ruby-2.0.0-p353/bin/ruby
 /usr/bin/node

Converters:

 /usr/bin/ffmpeg
 /usr/bin/convert

CacheStores:

 /usr/bin/memcached
 /usr/local/bin/redis-server

DataBases:

 /usr/bin/psql
 /usr/bin/mysql

Search:

 /usr/local/bin/searchd
 /usr/local/bin/elasticsearch

Helpers:

 /usr/bin/git
 /usr/bin/tmux
 /usr/bin/phantomjs

Image Optimizers:

 /usr/bin/gifsicle
 /usr/bin/jhead
 /usr/bin/jpegoptim
 /usr/bin/jpegtran
 /usr/bin/optipng
 /usr/bin/pngcrush
 /usr/local/bin/pngout
```

*Well done!*
