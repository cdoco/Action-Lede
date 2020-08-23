#!/bin/bash

echo "Test custom.sh"

source ../version
sed -i '92d'                                                                    package/system/opkg/Makefile
sed -i '/shadow/d'                                                              package/lean/default-settings/files/zzz-default-settings
sed -i '/nas/d'                                                                 package/lean/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/openwrt.download/g"                         package/lean/default-settings/files/zzz-default-settings
sed -i "s/https:/R20.0.0/g"                                                     package/lean/default-settings/files/zzz-default-settings
sed -i  's/http:/snapshots/g'                                                   package/lean/default-settings/files/zzz-default-settings
sed -i  " 23i sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf"               package/lean/default-settings/files/zzz-default-settings
sed -i  "s/R20\(.[0-9].[0-9]\{1,2\}\)/R20.$version/g"                           package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'                                package/lean/autosamba/Makefile

sed -i "2i # network config"                                                    package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.ipaddr='192.168.2.1'"                            package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'"                                  package/lean/default-settings/files/zzz-default-settings
sed -i "5i uci set network.lan.type='bridge'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "6i uci set network.lan.ifname='eth0'"                                   package/lean/default-settings/files/zzz-default-settings
sed -i "7i uci set network.lan.netmask='255.255.255.0'"                         package/lean/default-settings/files/zzz-default-settings
sed -i "10i uci commit network\n"                                               package/lean/default-settings/files/zzz-default-settings

rm -rf package/lean/luci-theme-argon
git clone https://github.com/destan19/OpenAppFilter.git                                                  package/oaf
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-luci/trunk/applications/luci-app-smartdns                       package/luci-app-smartdns
