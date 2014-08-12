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
root@178.62.15.173's password:
```

**Type *YOUR_ROOT_PASSWORD***

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
Pass: SFTP_PASSWORD

-------------------------------------------------------------------------------------
“These instructions are stored in /root/RAILS for your review.n”You can use the following MySQL database credentials:

DB: rails
User: rails
Pass: RAILS_USER_PASSWORD

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

**Well done!**

#### Visit your server via ssh key

1. Create new ssh pair on local machine *(if you need)*

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

