#!/bin/bash

sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'                                package/lean/autosamba/Makefile

# network
sed -i "2i # network config"                                                    package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.2.1'"                            package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'"                                  package/lean/default-settings/files/zzz-default-settings
sed -i "5i uci set network.lan.type='bridge'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "6i uci set network.lan.ifname='eth0'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "7i uci set network.lan.netmask='255.255.255.0'"                         package/lean/default-settings/files/zzz-default-settings
sed -i "10i uci commit network\n"                                               package/lean/default-settings/files/zzz-default-settings

# luci pakage
rm -rf package/lean/luci-theme-argon
git clone https://github.com/CCnut/feed-netkeeper.git -b openwrt-18.06                                   package/nk
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git                             package/luci-theme-infinityfreedom
git clone https://github.com/yangsongli/luci-theme-atmaterial.git                                        package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06                                     package/luci-theme-argon
git clone https://github.com/tty228/luci-app-serverchan.git                                              package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash.git -b master                                           package/luci-app-openclash
git clone https://github.com/max0y/luci-app-cd8021x.git -b master                                        package/luci-app-cd8021x
git clone https://github.com/destan19/OpenAppFilter.git                                                  package/oaf
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns                       package/luci-app-smartdns
