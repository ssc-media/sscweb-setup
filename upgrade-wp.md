# How to upgrade the old wordpress site

Still an old wordpress 3 is running on a site.
To migrate the server to EL8 (Rocky Linux 8), I need to upgrade to the newer wordpress.

## Prerequisite

- Setup the wordpress site on EL7.

## Upgrade to 4

On CentOS 7,
Set `version`=`3.7.37`, `4.9.19` and run these commands for each.

```
cd wordpress
mkdir old
mv * old/
mv old/wp-config.php .
mv old/wp-content .
mv old/wp-images .
rm -rf wp-content/cache wp-content/plugins/widgets
wget https://wordpress.org/wordpress-${version}.tar.gz
tar xzf wordpress-${version}.tar.gz --strip-component=1
```
Then open http://.../wp-admin/upgrade.php

## Migrate from the EL7 host to the target host

On the EL8 host,
ensure to setup the same user and database settings.
The settings are written in `wp-config.php`.
```
db='TBD'
user='TBD'
password='TBD'
sudo mysql -u root <<-EOF
create database $db;
create user '$user'@'localhost' identified by '$password';
grant all privileges on $db.* to '$user'@'localhost';
flush privileges;
EOF
```

On the EL7 host,
```
mysqldump -u ssc_test_user -p ssc_test_db > ssc_test_db.sql
```

On the EL8 host,
```
mysql -u ssc_test_user -p ssc_test_db < ssc_test_db.sql
```

## Upgrade to 5
The steps are same as upgrading to 4 from 3.

## Misc

### Clear tables
If you want to clear all tables,

```
mysql -u$u -p$p $db
drop table if exists wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users, wp_links, wp_commentmeta, wp_comments;
show tables;
```

## See also
- https://wordpress.org/support/article/upgrading-wordpress-extended-instructions/#upgrading-across-multiple-versions
  It is recommended to upgrade to 3.7, then upgrade to any version.
  It is also recommended to upgrade one major version at once.

