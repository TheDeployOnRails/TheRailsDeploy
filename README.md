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

**copy public ssh key on server for root**

```
cat ~/.ssh/id_rsa.pub | ssh root@178.62.15.173 'cat >> ~/.ssh/authorized_keys'
password: [ROOT_PASSWORD]
```

**copy public ssh key on server for  rails user**

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
