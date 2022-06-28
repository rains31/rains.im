title: Openssh8.8抛弃了ssh-rsa
author: Archer
date: 2022-06-28 11:34:25
tags:
---
官方给出的理由是，不够安全，太容易冲撞了。

当然，最好的办法是使用改用sha2-256或ed25519等更强的加密方式。

不过，对于那些比较老旧的服务器或嵌入式系统等不那么方便升级ssh服务端的环境，

还是继续使用ssh-rsa比较现实。

用你喜欢的编辑器打开 ~/.ssh/config
在里面添加下面两行：
```
HostKeyAlgorithms=ssh-rsa,ssh-rsa-cert-v01@openssh.com
PubkeyAcceptedAlgorithms=+ssh-rsa,ssh-rsa-cert-v01@openssh.com
```
即可。
