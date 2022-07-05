title: hexo-admin报错处理
author: Archer
date: 2022-07-05 08:27:06
tags:
---
发文过程报错，Error: Function yaml.safeLoad is removed in js-yaml 4. Use yaml.load instead, which is now safe by default.

原因是js-yaml 4中弃用了safeLoad方法，看上游暂时还没修复，本地先临时处理一下。
```
sed -i 's#yml\.safeLoad#yml\.load#g' ./node_modules/hexo-admin/api.js
```