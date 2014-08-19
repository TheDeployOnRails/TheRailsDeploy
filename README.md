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
Applications > Ubuntu 14.04 x64
```

or

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

**Setup your server**


[Ubuntu 14.04 x64 setup manual](https://github.com/the-teacher/TheRailsDeploy/blob/master/Ubuntu_14.04_x64.md)

[Ruby on Rails on Ubuntu 14.04 (Nginx + Unicorn) setup manual](https://github.com/the-teacher/TheRailsDeploy/blob/master/RoR_Nginx_Unicorn_14.04_x64.md)

**Ensure that ~/.ssh folders exists for users**

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

**Create ssh pair if it's required**

[How to create ssh pair](https://github.com/the-teacher/TheRailsDeploy/blob/master/how_to_create_shh_pair.md)


