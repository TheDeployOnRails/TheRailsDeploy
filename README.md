## TheRailsDeploy ...

Setup & Deploy your Rails App like a Boss

## ... on DigitalOcean

#### Create Droplet

1. Sign up, Log in
2. Create Droplet https://cloud.digitalocean.com/droplets/new

**Droplet Hostname**

```
MyRailsApp
```

**Select Size**

```
1GB / 1 CPU 30GB SSD Disk 2TB Transfer
Monthly $10.00 Hourly $0.015 
```

**Select Region**

```
as you wish
```

**Select Image**

```
Applications > Ruby on Rails on Ubuntu 14.04 (Nginx + Unicorn)
```

**Check your email**

```
Your new droplet has been created!

You can access it using the following credentials:
IP Address: 178.62.15.173
Username: root
Password: YOUR_ROOT_PASSWORD
```

**First visit**

```
ssh root@178.62.15.173
```

```
The authenticity of host '178.62.15.173 (178.62.15.173)' can't be established.
RSA key fingerprint is 7b:32:36:34:c5:c9:18:86:8e:12:84:21:23:f3:c8:af.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '178.62.15.173' (RSA) to the list of known hosts.
root@178.62.15.173's password: [YOUR_ROOT_PASSWORD]
```

```
You are required to change your password immediately (root enforced)
Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-27-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
You have new mail.
Last login: Tue Aug 12 04:33:10 2014 from 139.168.200.200
```

**Welcome and change your root password**

```
Changing password for root.
(current) UNIX password: YOUR_ROOT_PASSWORD

Enter  new UNIX password: ROOT_PASSWORD
Retype new UNIX password: ROOT_PASSWORD
```

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

*Well done!*

#### Visit your server via ssh key

**1.** Create new ssh pair on local machine *(if you need)*

**Create .ssh folder in HOME and check it**

```
mkdir -p ~/.ssh && ls -al ~/.ssh
```

**You should to create ssh keys if you see**

```
drwx------   6 admin  staff   204 Jun  2 22:46 .
drwxr-xr-x+ 46 admin  staff  1564 Aug 12 08:48 ..
```

**You can pass creating of ssh keys if you see something like this**

```
drwx------   6 admin  staff   204 Jun  2 22:46 .
drwxr-xr-x+ 46 admin  staff  1564 Aug 12 08:48 ..
-rw-------   1 admin  staff  1675 May 18 17:42 id_rsa
-rw-r--r--   1 admin  staff   398 May 18 17:42 id_rsa.pub
-rw-r--r--   1 admin  staff  6855 Aug 12 08:32 known_hosts
```

**Generate key pair**

```
ssh-keygen -t rsa -C "your_email@example.com"

# Creates a new ssh key, using the provided email as a label
# Generating public/private rsa key pair.
# Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
```

**Passphrase can be empty. Just press [Enter] twice**

```
Enter passphrase (empty for no passphrase): [Type a passphrase]
# Enter same passphrase again: [Type passphrase again]
```

**Which should give you something like this**

```
Your identification has been saved in /Users/you/.ssh/id_rsa.
# Your public key has been saved in /Users/you/.ssh/id_rsa.pub.
# The key fingerprint is:
# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your_email@example.com
```

**Then add your new key to the ssh-agent**

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa && ssh-add -L
```

*IMPORTANT: `ssh-add ~/.ssh/id_rsa && ssh-add -L` can be required on each system reboot*

**2.** Authorize your public ssh key on server

**ensure that ~/.ssh folders exists for users**

```
ssh root@178.62.15.173
root@178.62.15.173's password: [ROOT_PASSWORD]

mkdir -p ~/.ssh
```

```
ssh rails@178.62.15.173
root@178.62.15.173's password: [RAILS_USER_PASSWORD]

mkdir -p ~/.ssh
```

**Authorize public ssh key on server for root**

```
cat ~/.ssh/id_rsa.pub | ssh root@178.62.15.173 'cat >> ~/.ssh/authorized_keys'
password: [ROOT_PASSWORD]
```

**Authorize public ssh key on server for  rails user**

```
cat ~/.ssh/id_rsa.pub | ssh rails@178.62.15.173 'cat >> ~/.ssh/authorized_keys'
password: [RAILS_USER_PASSWORD]
```

**3.** Try to access to your server

If your Passphrase was empty, you will pass to server without password

```
ssh root@178.62.15.173
```

```
ssh rails@178.62.15.173
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

apt-get install checkinstall build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxslt1.1 libxslt1-dev libxml2 libxml2-dev libxslt-dev autoconf libc6-dev -y
```

**ImageMagick**

via sources

```
apt-get install libjpeg-dev libpng-dev libtiff-dev libgif-dev -y
```

```
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
apt-get update --fix-missing

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
```

**PostgreSql**

```
apt-get install postgresql postgresql-contrib  libpq-dev -y
```

If user `postgres` are required

```
# createuser -s postgres

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
