
## Prepare httpdocs directory
```
sudo su - sakae
git clone git@github.com:sakaeshalom/httpdocs.git
echo Deny from all >> httpdocs/.git/.htaccess
git config pull.ff only
```

## Setup Apache and MySQL
```
sudo dnf install httpd
sudo dnf install php php-dba php-mysqlnd
sudo dnf install mysql mysql-libs mysql-server
sudoedit /etc/httpd/conf/httpd.conf
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --add-port=80/tcp
sudo systemctl start mysqld
sudo systemctl enable mysqld
```

Configure `/etc/httpd/conf/httpd.conf` as below.

```
DocumentRoot "/home/sakae/httpdocs"
```

Also replace `/var/www`.

## Start Apache
```
sudo systemctl restart httpd
```

## Setup automatic deploy from github
*This configuration is required only once when the web server is replaced.*

### Create keys
```
ssh-keygen -t ed25519 -f github-deploy-sshkey
cat github-deploy-sshkey.pub >> .ssh/authorized_keys
base64 -w0 github-deploy-sshkey
```

### Check the host key
Find the line of the host key in your `~/.ssh/known_hosts` and encode with `base64 -w0`.

### Register the secret keys to github actions

1. Open https://github.com/sakaeshalom/httpdocs/settings and go to Secrets / Actions.
2. Click `New repository secrets`.
   Set the name as `WWW_DEPLOY_SSHKEY` and the value as the above base64-encoded value. Ensure to input `=` at the end.
3. Add another secrets.
   Set the name as `WWW_DEPLOY_ACCOUNT` and the value as the user name and host name separated by `@`.
3. Add another secrets.
   Set the name as `WWW_DEPLOY_HOSTKEY` and the value as the above base64-encoded value. Ensure to input `=` at the end.
