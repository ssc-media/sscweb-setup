# カゴヤVPSでの設定

## ユーザー作成

```
adduser sakae
passwd sakae
echo 'sakae ALL=(ALL) ALL' >> /etc/sudoers
su - sakae
ssh-keygen -t rsa -b 8192
```

その他、管理者一人ひとりのアカウントも同様に作成する。

各管理者は、 `.ssh/authorized_keys` を設定し、ログインできるようにする。

作成したユーザーでSSHログインできるようになったら、rootログインを禁止する。
`/root/.ssh/`の内容を確認しておく。
```
sudo rm /root/.ssh/authorized_keys
sudo ls /root/.ssh/
```


## ツールのインストール

以下の操作は、管理者で行う。

```
sudo dnf install git
```


