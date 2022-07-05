title: ax6s救砖记
author: Archer
date: 2022-07-05 08:53:25
tags:
---
前几天手贱把ax6s折腾死了。

死的方式是：我看到22.03-rc4已经发布，心想着rc4离正式发布已经不远了，之前刷的snapshot固件内核版本老是变，经常要手工升级，有点烦，不如试试rc4，我上传rc4固件后，它警告我上传的包无法验证，是否要强刷，我头铁的选了是，等ax6s刷完重启完就一直亮黄灯，lan下的设备直接获取到了上级路由器dhcp分配的动态ip，Sorry，说它是砖可能委屈它了，它分明是变成了一个傻瓜交换机，还是千兆的，比砖还是强一些的。

网上搜了一下别人的救砖经验，基本都是tftp+dhcp在路由器reset状态下刷rom。

别人用的windows下的tftp，我手头只有个archlinux,自带的dnsmasq，dhcp和tftp全有了。

把准备好的ax6s rom放进tftp root下，第一次没有成功，为了便于查看问题，把log全开。
发现我的ax6s没有像网上说的那样去请求C0A81F02.img，而是请求了pxelinux.0，然而这个文件不存在，看来是以前设置的dhcp-boot选项影响了它，直接把rom改名为pxelinux.0，重来一次，先把wan口连pc网口，然后用卡针戳着ax6s的reset孔开机，看黄灯闪烁后松手，看着dnsmasq的日志没有再报错，几分钟后，小蓝灯重新亮起。搞定。

ps：网上ax6s刷机教程大多需要刷一个中间过渡版openwrt。但是经过实践，从1.2.7测试版完全可以直接telnet进去，wget一个openwrt 22.03-rc4的固件(那个wget貌似不支持https，如果找不到能http下载的资源，可以先下载到本地然后python -m http.server起一个http服务)，mtd写入就行，那个过渡版固件完全没必要刷（小心别人在固件里留后门）。