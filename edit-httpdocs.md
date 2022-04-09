# Edit the website

This document describes how to edit the website of Sakae Shalom Church.
The supported platforms are macOS and Linux.

## Setup your access
*This configuration is required only once for each user.*

### Option 1: Add your Github account as a collabolator

1. Mail your github account name to the administrator. The administrator will do the following steps.
2. Login to github with the account `sakaeshalom`.
3. Go to https://github.com/sakaeshalom/httpdocs/settings/access add the account.

Note: By this step, the user can access only the repository `httpdocs` but can access the issue page, PR, etc.

### Option 2: Add your ssh key

1. If you don't have ssh public key, create it. Type these two lines in your terminal.
   ```
   ssh-keygen -t ed25519
   cat ~/.ssh/id_ed25519.pub
   ```
2. Mail the above key to the administrator. The administrator will do the following steps.
3. Login to github with the account `sakaeshalom`.
4. Go to https://github.com/sakaeshalom/httpdocs/settings/access
5. Register the key.

Note: By this step, the user can access all repositories in the account `sakaeshalom` but cannot access the issue page, PR, etc.

Note: You may setup both options.

## Create your workspace
*This configuration is required only once for each user.*

1. In your terminal, run this command.
   ```
   git clone git@github.com:sakaeshalom/httpdocs.git
   ```
   A directory named `httpdocs` will be created.

## Edit and push

1. Pull the latest files just in case if someone else has changed.
   ```
   git pull
   ```
2. Edit a file by your favorite editor.
3. Commit changes
   ```
   cd httpdocs
   git add -p .
   git commit -m 'Brief comment what you have changed'
   ```
   In above step, `git add -p .` will ask you if you want to add your change one by one.
   When running `git commit`, replace the text surrounded by quotes `'`.
   Note: When commiting changes, please try not to commit garbage files.
4. If you add a new file, run this before `git commit`.
   ```
   git add your_new_file
   ```
   (Replace `your_new_file` with the file name you want to add.)
5. Push the change
   ```
   git push
   ```
   Once pushed to github, your change will be automatically deployed. Check this page to see the status. https://github.com/sakaeshalom/httpdocs/actions
