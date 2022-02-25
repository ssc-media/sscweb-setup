# カゴヤVPSでの設定

## ユーザー作成

```
adduser sakae
passwd sakae
su - sakae
ssh-keygen -t rsa -b 8192
```

その他、管理者一人ひとりのアカウントも同様に作成し、
`/etc/sudoers` にも設定する。

Note: `sakae` は、`sudoers`には設定しない。

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

https://github.com/ で `sakaeshalom` にてログインし、
作成したSSH公開鍵を https://github.com/settings/keys で設定する。

```
git clone git@github.com:sakaeshalom/sscweb-setup.git
cd sscweb-setup
git submodule update --init
```

## その他のツールのインストール
```
sudo dnf install telnet bind-utils vim-enhanced
sudo dnf install rsyslog mutt
sudo dnf install tar
sudo dnf config-manager --set-enabled powertools
sudo dnf install epel-release
sudo dnf config-manager --set-disabled epel epel-modular
```
