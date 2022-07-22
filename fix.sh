#!/bin/sh
sed -i 's#yml\.safeLoad#yml\.load#g' ./node_modules/hexo-admin/api.js
