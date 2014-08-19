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
