## Install packages

```sh
sudo dnf install logwatch patch
```

## Configure weekly report

```sh
cd /etc/
sudo mv cron.daily/0logwatch cron.weekly/
sudoedit cron.weekly/0logwatch
```

Edit the file as below.
```patch
@@ -5,9 +5,9 @@
 #Add options to this line. Most options should be defined in /etc/logwatch/conf/logwatch.conf,
 #but some are only for the nightly cronrun such as --output mail and should be set here.
 #Other options to consider might be "--format html" or "--encode base64", man logwatch for more details.
-OPTIONS="--output mail"
+OPTIONS=(--output mail --range 'between -7 days and -1 days')
 
 #Call logwatch
-$LOGWATCH_SCRIPT $OPTIONS
+$LOGWATCH_SCRIPT "${OPTIONS[@]}"
 
 exit 0
EOF
```

Check the edited script.
```sh
sudo /etc/cron.weekly/0logwatch
```
